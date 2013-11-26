module Weight 
where

data Weight 
    = Gramm Float
    deriving (Eq)


inGramm :: Weight -> Float
inGramm (Gramm g) = g

instance Num Weight where
    (Gramm w1) + (Gramm w2) = Gramm (w1 + w2)
    (Gramm w1) * (Gramm w2) = Gramm (w1 * w2)
    abs (Gramm w)           = Gramm (abs w)
    signum (Gramm w)        = Gramm (signum w)
    fromInteger x           = Gramm (fromInteger x)


