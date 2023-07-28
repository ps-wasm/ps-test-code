module Wasm.Ord
  ( class Ord
  , (/=)
  , (<)
  , (==)
  , (>)
  , eq
  , equal
  , greaterThan
  , lessThan
  , notEq
  )
  where

class Ord a where
  --Ord
  lessThan :: a -> a -> Boolean
  greaterThan :: a -> a -> Boolean
  equal :: a -> a -> Boolean
  --Eq
  eq :: a -> a -> Boolean
    
--Ord
infixl 4 lessThan as <
infixl 4 greaterThan as >
infixl 4 equal as ==
--Eq
infix 4 notEq as /=

instance ordInt :: Ord Int where
  --Ord
  lessThan = ltIntImpl
  greaterThan = gtIntImpl
  equal = eqIntImpl
  --Eq
  eq = eqIntImpl

instance ordNumb :: Ord Number where
  --Ord
  lessThan = ltNumbImpl
  greaterThan = gtNumbImpl
  equal = eqNumbImpl
  --Eq
  eq = eqNumberImpl
    
instance ordBoolean :: Ord Boolean where
  --Ord
  lessThan = ltBooleanImpl
  greaterThan = gtBooleanImpl
  equal = equalBooleanImpl
  --Eq
  eq = eqBooleanImpl

notEq :: forall a. Ord a => a -> a -> Boolean
notEq x y = (x == y) == false

foreign import ltIntImpl :: Int -> Int -> Boolean
foreign import gtIntImpl :: Int -> Int -> Boolean
foreign import eqIntImpl :: Int -> Int -> Boolean
foreign import ltNumbImpl :: Number -> Number -> Boolean
foreign import gtNumbImpl :: Number -> Number -> Boolean
foreign import eqNumbImpl :: Number -> Number -> Boolean
foreign import eqBooleanImpl :: Boolean -> Boolean -> Boolean
foreign import eqNumberImpl :: Number -> Number -> Boolean
foreign import ltBooleanImpl :: Boolean -> Boolean -> Boolean
foreign import gtBooleanImpl :: Boolean -> Boolean -> Boolean
foreign import equalBooleanImpl :: Boolean -> Boolean -> Boolean