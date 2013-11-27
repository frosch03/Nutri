{-# OPTIONS_HADDOCK prune, ignore-exports #-}

-- | Within this module, various food items are defined. They are
-- defined without any weight information. Within the 'Nutri'-module,
-- the amount of a specific food can be generated via: @(Gramm 150)
-- .@ quark@.

module VariousFoods

where

import Food   
import Defaults
import Weight

-- | turkey-breast
putenbrust :: Weight -> Food
putenbrust
    = foodGenerator
      "Putenbrust"
      (21, 1, 1)

-- | Rice
reis :: Weight -> Food
reis 
    = foodGenerator
      "Reis"
      (7, 77, 1)

-- | Curd
quark :: Weight -> Food
quark 
    = foodGenerator
      "Speisequark"
      (12, 4, 1)

-- | Cream-Cheese
frischkaese :: Weight -> Food
frischkaese 
    = foodGenerator 
      "körniger Frischkäse"
      (12, 4, 0)

-- | Chicken strips
haenchenstreifen :: Weight -> Food
haenchenstreifen 
    = foodGenerator
      "Hähnchen-Filetstreifen"
      (25, 2, 5)

-- | Schnitzel (you know what i mean ;-) 
schnitzelLutz :: Weight -> Food
schnitzelLutz
    = foodGenerator
      "Schnitzel"
      (16, 17, 8)

-- | Caesar-Salad 
caesarSalat :: Weight -> Food
caesarSalat
    = foodGenerator
      "Caesar Salat"
      (4, 6, 9)

wheyProtein :: Weight -> Food
wheyProtein
    = foodGenerator
      "Eiweisdrink"
      (80, 8, 4) -- TODO: correct? 

risoniNudelsalat :: Weight -> Food
risoniNudelsalat
    = foodGenerator
      "Risoni-Nudelsalat"
      (8, 10, 7)

mUndmMini :: Weight -> Food
mUndmMini
    = foodGenerator
      "M&M Mini"
      (9, 60, 25)
      
subwayTurkyHam :: Weight -> Food
subwayTurkyHam
    = foodGenerator
      "Sub-Turky&Ham"
      (10, 18, 3)

subwayFajita :: Weight -> Food
subwayFajita
    = foodGenerator
      "Sub-ChickenFajita"
      (10, 19, 3)

subwayChickenBreast :: Weight -> Food
subwayChickenBreast
    = foodGenerator
      "Sub-ChickenBreast"
      (10, 19, 5)

subwayTeriyaki :: Weight -> Food
subwayTeriyaki
    = foodGenerator
      "Sub-Teriyaki"
      (9, 19, 3)

subwayHam :: Weight -> Food
subwayHam
    = foodGenerator
      "Sub-Ham"
      (9, 20, 3)

subwayTurky :: Weight -> Food
subwayTurky
    = foodGenerator
      "Sub-Turky"
      (10, 19, 3)

subwayVeggi :: Weight -> Food
subwayVeggi
    = foodGenerator
      "Sub-Veggi"
      (6, 26, 4)

subwayTurkyHamBacon :: Weight -> Food
subwayTurkyHamBacon
    = foodGenerator
      "Sub-Turky&Ham&Bacon"
      (12, 17, 3)

