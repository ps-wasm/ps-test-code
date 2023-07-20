module Wasm.EuclideanRing
  ( class EuclideanRing
  , degree
  , div
  , mod
  , (/)
  , add
  , zero
  , mul
  , one
  , (*)
  , (+)
  , sub
  , (-)
  ) where

class EuclideanRing a where
  --EuclideanRing
  degree :: a -> Int
  div :: a -> a -> a
  mod :: a -> a -> a
  --SemiRing
  add :: a -> a -> a
  zero :: a
  mul :: a -> a -> a
  one :: a
  --Ring
  sub :: a -> a -> a

--CommutativeRing
infixl 7 div as /
--SemiRing
infixl 6 add as +
infixl 7 mul as *
--Ring
infixl 6 sub as -

--CommutativeRing
-- instance commutativeRingInt :: EuclideanRing Int
-- instance commutativeRingNumber :: EuclideanRing Number

--EuclideanRing
instance euclideanRingInt :: EuclideanRing Int where
  --euclideanRing
  degree = intDegree
  div = intDiv
  mod = intMod
  --SemiRing
  add = intAdd
  zero = 0
  mul = intMul
  one = 1
  --Ring
  sub = intSub

instance euclideanRingNumber :: EuclideanRing Number where
  --euclideanRing
  degree _ = 1
  div = numDiv
  mod _ _ = 0.0
  --SemiRing
  add = numAdd
  zero = 0.0
  mul = numMul
  one = 1.0
  --Ring
  sub = numSub

negate :: forall a. EuclideanRing a => a -> a
negate a = zero - a

--EuclideanRing
foreign import intDegree :: Int -> Int
foreign import intDiv :: Int -> Int -> Int
foreign import intMod :: Int -> Int -> Int

foreign import numDiv :: Number -> Number -> Number
--SemiRing
foreign import intAdd :: Int -> Int -> Int
foreign import intMul :: Int -> Int -> Int
foreign import numAdd :: Number -> Number -> Number
foreign import numMul :: Number -> Number -> Number
--Ring
foreign import intSub :: Int -> Int -> Int
foreign import numSub :: Number -> Number -> Number
