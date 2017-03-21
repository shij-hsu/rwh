-- file: ch13/Monoid.hs
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype AInt = A {unA::Int} deriving (Show, Eq, Num)

instance Monoid AInt where
  mempty = 0
  mappend = (+)

newtype MInt = M { unM :: Int} deriving (Show, Eq, Num)
instance Monoid MInt where
  mempty = 1
  mappend = (*)
