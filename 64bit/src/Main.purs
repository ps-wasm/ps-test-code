module Main
  where

import Wasm.EuclideanRing
import Wasm.Ord

--myCalc :: forall a. Semiring a => a -> a -> a
--myCalc x y = x + y * y

{-
class TestClass a where
  testFn :: a -> a -> a
  testGb :: a


instance testjeInt :: TestClass Int where
  testFn = (+)
  testGb = 9
  

instance testjeNumber :: TestClass Number where
  testGb = 13.0
  testFn = (*)
-}

sumWithTC :: forall a. EuclideanRing a => a -> a -> a
sumWithTC x y = (x * x + x) / y

sumWithTCNumber :: Number -> Number -> Number
sumWithTCNumber = sumWithTC 

-- sum :: Number -> Number
-- sum x = (x * (x+1.0))/2.0

-- sum2 :: Number -> Number
-- sum2 n = if n == 0.0 then 0.0 else n + sum2 ( n - 1.0 )

-- sum3 :: Number -> Number -> Number
-- sum3 x y = if y == x then x else (y + (sum3 x ( y - 1.0 )))

-- sum3 :: Number -> Number -> Number
-- sum3 x y = if y > 0.0 then (y + (sum3 x ( y - 1.0))) else 0.0

-- fibonacci :: Number -> Number
-- fibonacci n = if (n == 0.0) then 0.0 else if (n == 1.0) then 1.0 else fibonacci (n - 2.0) + fibonacci (n - 1.0)


