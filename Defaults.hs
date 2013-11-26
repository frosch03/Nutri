{-# OPTIONS_HADDOCK prune, ignore-exports #-}


module Defaults
where

type Percent = Float

type Protein = Percent 
type Carb    = Percent 
type Fat     = Percent  

type Name    = String

-- | Default caloric values for proteins, carbohydrates and fats
kcalOfProt, kcalOfCarb, kcalOfFat  :: Float
kcalOfProt = 4.1
kcalOfCarb = 4.1
kcalOfFat  = 9.3

