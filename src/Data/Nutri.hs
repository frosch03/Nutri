{-# OPTIONS_HADDOCK prune, ignore-exports #-}

-- | Nutri is actual something like the Main module. It shows a simple
-- usage of the Nutri-library

module Data.Nutri
where

import Data.Monoid

import Data.Nutrition.Food   
import Data.Nutrition.Defaults
import Data.Nutrition.Weight
import Data.Nutrition.VariousFoods

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

tag3 :: Food
tag3 =    (Gramm 500) .@ quark
       <> (Gramm 100) .@ wheyProtein
       <> (Gramm 440) .@ subwayTurkyHam
