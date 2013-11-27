{-# OPTIONS_HADDOCK prune, ignore-exports #-}

module Data.Nutrition.Food
    ( Food ()
    , Data.Nutrition.Food.prot
    , Data.Nutrition.Food.carb
    , Data.Nutrition.Food.fat

    , (.@)

    , foodGenerator
    )
where

import Data.Monoid
import Data.Nutrition.Weight
import Data.Nutrition.Macros hiding (prot, carb, fat)
import Data.Nutrition.Macros as M
import Data.Nutrition.Defaults

-- | The Food data type consists of four things: 
-- 
-- * @foodname@ A name of the food. 
-- 
-- * @macros@   The macro nutrients of that specific food-item.
-- 
-- * @calories@ A calculated caloric value saved in kilo calories. 
-- 
-- * @amount@   The amount of the actual food. 
data Food 
    = Food 
      { foodname :: Name 
      , macros :: Macros 
      , calories :: Int  
      , amount :: Weight 
      } 

-- | A simple operator so one can write the 'Weight' value prefix to
-- the food.
(.@) :: Weight -> (Weight -> Food) -> Food
(.@) w f = f w 

-- | kcal takes a food item and gives back the kilo-caloric
-- value. This value is calculated from the macro-nutrition values.
kcal :: Food -> Int
kcal f 
    = round $ protkcal + carbkcal + fatkcal
    where 
      protkcal = kcalOfProt * (Data.Nutrition.Food.prot f)
      carbkcal = kcalOfCarb * (Data.Nutrition.Food.carb f)
      fatkcal  = kcalOfFat  * (Data.Nutrition.Food.fat f)



-- | This function is a "smart constructor" to construct a food
-- item. If no 'Weight' is supplied, a food generating function for a
-- specific food item is returned. 
foodGenerator :: String -> (Protein, Carb, Fat) -> (Weight -> Food)
foodGenerator s (p, c, f) w
    = Food
        s
        (newMacros (p, c, f))
        (round $ kcalOfProt * p / 100.0 * inGramm w
               + kcalOfCarb * c / 100.0 * inGramm w
               + kcalOfFat  * f / 100.0 * inGramm w)
        w

-- | The 'prot', 'carb' and 'fat' functions return the value of the
-- macro-nutrients in gram's. 
prot, carb, fat :: Food -> Float
prot f = (inGramm.amount $ f) * (M.prot . macros $ f) / 100.0
carb f = (inGramm.amount $ f) * (M.carb . macros $ f) / 100.0
fat  f = (inGramm.amount $ f) * (M.fat  . macros $ f) / 100.0


-- | 'Food' is an instance of the Show class, so it can be printed
-- onto the screen.
instance Show Food where
    show (Food n ms cals (Gramm a))
         = show (round a) ++ "g (" ++ show cals ++ " kcal) " ++ n ++ " (Prot: " ++ show (round $ M.prot ms) ++ "%, Carb: " 
                                             ++ show (round $ M.carb ms) ++ "%, Fat: " 
                                             ++ show (round $ M.fat ms)  ++ "%)\n"
           where prot_g = a * (M.prot ms) / 100.0
                 carb_g = a * (M.carb ms) / 100.0
                 fat_g  = a * (M.fat  ms) / 100.0


                  
-- | 'Food' is an instance of the Monoid class. That leads to the
-- possibility of combining foods to meals together.
instance Monoid Food where
    mempty 
        = Food "" (newMacros (0, 0, 0)) 0 (Gramm 0)

    f1 `mappend` f2
        = addFood f1 f2 


-- | The 'addFood' function does the combination of two foods into
-- another one.
addFood :: Food -> Food -> Food
addFood f1 f2
    = Food { foodname = foodname f1 ++ " and " ++ foodname f2 
           , macros = newMacros ( ((Data.Nutrition.Food.prot f1) + (Data.Nutrition.Food.prot f2)) / fact'
                                , ((Data.Nutrition.Food.carb f1) + (Data.Nutrition.Food.carb f2)) / fact'
                                , ((Data.Nutrition.Food.fat  f1) + (Data.Nutrition.Food.fat  f2)) / fact'
                                )
           , calories = calories f1 + calories f2
           , amount = amount f1 + amount f2
           }
    where 
      fact1 = (fG $ amount f1) / 100.0
      fact2 = (fG $ amount f2) / 100.0
      fact' = (fact1 + fact2)
      mf1 = macros f1
      mf2 = macros f2
      fG (Gramm x) = x


