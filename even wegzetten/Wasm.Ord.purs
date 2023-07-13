module Wasm.Ord
  ( class Ord
  , lessThan
  , (<)
  , greaterThan
  , (>)
  ) where

import Wasm.Eq (class Eq, (/=))
import Wasm.Ring (class Ring, negate) -- originally zero and one where imported from here
import Wasm.Semiring (zero, one)

class Eq a <= Ord a where
    lessThan :: a -> a -> Boolean
    greaterThan :: a -> a -> Boolean
    
instance ordInt :: Ord Int where
    lessThan = ltIntImpl
    greaterThan = gtIntImpl

instance ordNumb :: Ord Number where
    lessThan = ltNumbImpl
    greaterThan = gtNumbImpl

infixl 4 lessThan as <
infixl 4 greaterThan as >

foreign import ltIntImpl :: Int -> Int -> Boolean
foreign import gtIntImpl :: Int -> Int -> Boolean
foreign import ltNumbImpl :: Number -> Number -> Boolean
foreign import gtNumbImpl :: Number -> Number -> Boolean