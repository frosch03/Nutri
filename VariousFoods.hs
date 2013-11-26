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

-- | Turkey-breast
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
