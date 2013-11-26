module Nutri
where

import Data.Monoid

import Food   
import Defaults
import Weight
import VariousFoods



tag1 :: Food
tag1 =    (Gramm 250) .@ schnitzelLutz 
       <> (Gramm 500) .@ quark
       <> (Gramm 200) .@ frischkaese 
       <> (Gramm 150) .@ haenchenstreifen 

tag2 :: Food
tag2 =    (Gramm 500) .@ quark
       <> (Gramm 150) .@ haenchenstreifen
