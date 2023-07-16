module Wasm.Fac
  ( fac
  , module Wasm.Fac
  )
  where

import Wasm.Ring ((-))
import Wasm.Eq ((==))
import Wasm.Semiring ((*), zero, one)

class Fac a where
  fac :: a -> a

instance facInt :: Fac Int where
  fac = facIntImpl
-- fac :: Int -> Int
-- fac n = if (n == 0) then 1 else n * fac (n - 1)

-- instance facNumb :: Fac Number where
--   fac = numbFac

-- the factorial n function (version 2)
-- fac ::  Int -> Int
-- fac n = if (n == 0) then 1 else (n * fac (n - 1))

-- -- the factorial n function (version 2)
-- fac2 ::  Number -> Number
-- fac2 n = if (n == 0) then 1 else (n * fac2 (n - 1))


-- fac2 :: Number -> Number
-- fac2 n = if (n == zero) then one else n * fac (n - one)

-- class Fac a <= Ring a where
--   fac :: a -> a

-- instance Fac Int where
--   fac 0 = 1
--   fac n = fac(n - 1)

-- -- instance facNumber :: Fac Number where
-- --   fac = numFac

-- foreign import intFac :: Int -> Int
-- -- foreign import numFac :: Number -> Number

-- foreign import intFac :: Int -> Int
-- foreign import numbFac :: Number -> Number

-- foreign import facIntImpl ::  Int -> Int


