module Wasm.CommutativeRing
  ( class CommutativeRing
  , module Wasm.Ring
  , module Wasm.Semiring
  ) where

import Wasm.Ring (class Ring)
import Wasm.Semiring (class Semiring, add, mul, one, zero, (*), (+))

class Ring a <= CommutativeRing a

instance commutativeRingInt :: CommutativeRing Int
instance commutativeRingNumber :: CommutativeRing Number