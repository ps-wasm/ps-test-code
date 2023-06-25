module Wasm.Ring
  ( class Ring
  , sub
  , negate
  , (-)
  ) where

import Wasm.Semiring (class Semiring, add, mul, one, zero, (*), (+))

class Semiring a <= Ring a where
  sub :: a -> a -> a

infixl 6 sub as -

instance ringInt :: Ring Int where
  sub = intSub

instance ringNumber :: Ring Number where
  sub = numSub

negate :: forall a. Ring a => a -> a
negate a = zero - a

foreign import intSub :: Int -> Int -> Int
foreign import numSub :: Number -> Number -> Number