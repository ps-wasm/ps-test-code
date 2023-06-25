module Wasm.Eq
  ( class Eq
  , eq
  , (==)
  , notEq
  , (/=)
  ) where


-- | The `Eq` type class represents types which support decidable equality.
-- |
-- | `Eq` instances should satisfy the following laws:
-- |
-- | - Reflexivity: `x == x = true`
-- | - Symmetry: `x == y = y == x`
-- | - Transitivity: if `x == y` and `y == z` then `x == z`
-- |
-- | **Note:** The `Number` type is not an entirely law abiding member of this
-- | class due to the presence of `NaN`, since `NaN /= NaN`. Additionally,
-- | computing with `Number` can result in a loss of precision, so sometimes
-- | values that should be equivalent are not.
class Eq a where
  eq :: a -> a -> Boolean

infix 4 eq as ==

-- | `notEq` tests whether one value is _not equal_ to another. Shorthand for
-- | `not (eq x y)`.
notEq :: forall a. Eq a => a -> a -> Boolean
notEq x y = (x == y) == false

infix 4 notEq as /=


instance eqBoolean :: Eq Boolean where
  eq = eqBooleanImpl


instance eqInt :: Eq Int where
  eq = eqIntImpl

instance eqNumber :: Eq Number where
  eq = eqNumberImpl

foreign import eqBooleanImpl :: Boolean -> Boolean -> Boolean
foreign import eqIntImpl :: Int -> Int -> Boolean
foreign import eqNumberImpl :: Number -> Number -> Boolean