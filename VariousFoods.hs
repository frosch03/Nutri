module VariousFoods

where

import Food   
import Defaults
import Weight


quark :: Weight -> Food
quark 
    = foodGenerator
      "Speisequark"
      (12, 4, 1)

frischkaese :: Weight -> Food
frischkaese 
    = foodGenerator 
      "körniger Frischkäse"
      (12, 4, 0)

haenchenstreifen :: Weight -> Food
haenchenstreifen 
    = foodGenerator
      "Hähnchen-Filetstreifen"
      (25, 2, 5)

schnitzelLutz :: Weight -> Food
schnitzelLutz
    = foodGenerator
      "Schnitzel"
      (16, 17, 8)

caesarSalat :: Weight -> Food
caesarSalat
    = foodGenerator
      "Caesar Salat"
      (4, 6, 9)
