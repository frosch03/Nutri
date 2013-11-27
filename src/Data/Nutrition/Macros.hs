{-# OPTIONS_HADDOCK prune, ignore-exports #-}

module Data.Nutrition.Macros
    ( 
      Macros ()
    , newMacros 

    , prot
    , carb
    , fat

    )
where


import Control.Category

type Percent = Float

type Protein = Percent  
type Carb    = Percent 
type Fat     = Percent 

-- | The macro nutrients are @Protein@, @Carbohydrate@ and @Fat@. They
-- are stored within a triple that is called 'Macros'.
data Macros = Macros (Protein, Carb, Fat)


-- | 'prot', 'carb' and 'fat' are functions that return the percent of
-- that macro nutrient. They are basically getters of the 'Macros'
-- data.
prot, fat, carb :: Macros -> Percent
prot (Macros (p, _, _)) = p
carb (Macros (_, c, _)) = c
fat  (Macros (_, _, f)) = f

-- | 'newMacros' is a smart constructor to 'Macros'. It checks,
-- whether the sum of the percentages is equal or below
-- 100%. Otherwise it does not construct a 'Macros' value.
newMacros :: (Protein, Carb, Fat) -> Macros
newMacros (p, c, f) 
         | (p + c + f) <= 100 = Macros (p, c, f)
         | otherwise         = error $ "macro definition exeeds 100%"


-- instance Num Macros where
--     m1 + m2 = newMacros $ percentualDo (+) (prot m1, carb m1, fat m1) (prot m2, carb m2, fat m2)
--     m1 - m2 = newMacros $ percentualDo (-) (prot m1, carb m1, fat m1) (prot m2, carb m2, fat m2)
--     (*) = error "this operation isn't defined on macros"

-- percentualDo op (p1, c1, f1) (p2, c2, f2) 
--     = (p, c, f)
--     where sum1 = p1 + c1 + f1
--           sum2 = p2 + c2 + f2
--           percentCalc op sum1 sum2 v1 v2 
--               = (v1 * 100.0 / sum1) `op` (v2 * 100.0 / sum2) / 2
--           p = percentCalc op sum1 sum2 p1 p2
--           c = percentCalc op sum1 sum2 c1 c2
--           f = percentCalc op sum1 sum2 f1 f2
