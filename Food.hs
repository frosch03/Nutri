module Food
    ( Food ()
    , Food.prot
    , Food.carb
    , Food.fat

    , (.@)

    , foodGenerator
    )
where

import Data.Monoid
import Weight
import Macros hiding (prot, carb, fat)
import Macros as M
import Defaults

data Food 
    = Food 
      { foodname :: Name
      , macros :: Macros 
      , calories :: Int
      , amount :: Weight
      } 

(.@) :: Weight -> (Weight -> Food) -> Food
(.@) w f = f w 

kcal :: Food -> Int
kcal f 
    = round $ protkcal + carbkcal + fatkcal
    where 
      protkcal = kcalOfProt * (Food.prot f)
      carbkcal = kcalOfCarb * (Food.carb f)
      fatkcal  = kcalOfFat  * (Food.fat f)

foodGenerator :: String -> (Protein, Carb, Fat) -> (Weight -> Food)
foodGenerator s (p, c, f) w
    = Food
        s
        (newMacros (p, c, f))
        (round $ kcalOfProt * p / 100.0 * inGramm w
               + kcalOfCarb * c / 100.0 * inGramm w
               + kcalOfFat  * f / 100.0 * inGramm w)
        w

prot, carb, fat :: Food -> Float
prot f = (inGramm.amount $ f) * (M.prot . macros $ f) / 100.0
carb f = (inGramm.amount $ f) * (M.carb . macros $ f) / 100.0
fat  f = (inGramm.amount $ f) * (M.fat  . macros $ f) / 100.0

instance Show Food where
    show (Food n ms cals (Gramm a))
         = show (round a) ++ "g (" ++ show cals ++ " kcal) " ++ n ++ " (Prot: " ++ show (round $ M.prot ms) ++ "%, Carb: " 
                                             ++ show (round $ M.carb ms) ++ "%, Fat: " 
                                             ++ show (round $ M.fat ms)  ++ "%)\n"
           where prot_g = a * (M.prot ms) / 100.0
                 carb_g = a * (M.carb ms) / 100.0
                 fat_g  = a * (M.fat  ms) / 100.0


                  
instance Monoid Food where
    mempty 
        = Food "" (newMacros (0, 0, 0)) 0 (Gramm 0)

    f1 `mappend` f2
        = addFood f1 f2 


addFood :: Food -> Food -> Food
addFood f1 f2
    = Food { foodname = foodname f1 ++ " and " ++ foodname f2 
           , macros = newMacros ( ((Food.prot f1) + (Food.prot f2)) / fact'
                                , ((Food.carb f1) + (Food.carb f2)) / fact'
                                , ((Food.fat  f1) + (Food.fat  f2)) / fact'
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


