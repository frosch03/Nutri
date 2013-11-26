module Defaults
where

type Percent = Float

type Protein = Percent 
type Fat     = Percent  
type Carb    = Percent 

type Name    = String

kcalOfProt, kcalOfCarb, kcalOfFat  :: Float
kcalOfProt = 4.1
kcalOfCarb = 4.1
kcalOfFat  = 9.3

