module Wasm.Ordering (Ordering(..), invert) where

import Wasm.Eq (class Eq)

-- | The `Ordering` data type represents the three possible outcomes of
-- | comparing two values:
-- |
-- | `LT` - The first value is _less than_ the second.
-- | `GT` - The first value is _greater than_ the second.
-- | `EQ` - The first value is _equal to_ the second.
data Ordering = LT | GT | EQ

instance eqOrdering :: Eq Ordering where
  eq LT LT = true
  eq GT GT = true
  eq EQ EQ = true
  eq _ _ = false


-- | Reverses an `Ordering` value, flipping greater than for less than while
-- | preserving equality.
invert :: Ordering -> Ordering
invert GT = LT
invert EQ = EQ
invert LT = GT