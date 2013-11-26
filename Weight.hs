{-# OPTIONS_HADDOCK prune, ignore-exports #-}

module Weight 
where

data Weight 
    = Gramm Float
    deriving (Eq)


-- | This Function return the weight as a floating point number and
-- calculates that as a gramm value. (ATM there is only a Gramm-Weight
-- Constructor)
inGramm :: Weight -> Float
inGramm (Gramm g) = g


-- | A Weight is a member of the Typeclass 'Num'
instance Num Weight where
    (Gramm w1) + (Gramm w2) = Gramm (w1 + w2)
    (Gramm w1) * (Gramm w2) = Gramm (w1 * w2)
    abs (Gramm w)           = Gramm (abs w)
    signum (Gramm w)        = Gramm (signum w)
    fromInteger x           = Gramm (fromInteger x)


