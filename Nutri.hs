{-# OPTIONS_HADDOCK prune, ignore-exports #-}

-- | Nutri is actual something like the Main module. It shows a simple
-- usage of the Nutri-library

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
       <> (Gramm 380) .@ putenbrust
       <> (Gramm 100) .@ reis
