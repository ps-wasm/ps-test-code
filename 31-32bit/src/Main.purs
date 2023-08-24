module Main
  where

import Wasm.EuclideanRing
import Wasm.Ord


--tripleAdd :: Int -> Int -> Int -> Int
--tripleAdd x y z = x + y + z

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

-- addTwo :: Int -> (Int -> Int)
-- addTwo x = (+) 2

-- somMetTC :: forall a. EuclideanRing a => a -> a -> a
-- somMetTC x y = x + y

-- somInt :: Int -> Int -> Int
-- somInt = somMetTC

-- somGeenTC :: Int -> Int -> Int 
-- somGeenTC x y = x + y

sumWithTC :: forall a. EuclideanRing a => a -> a -> a
sumWithTC x y = (x * x + x) / y

sumWithTCInt :: Int -> Int -> Int
sumWithTCInt = sumWithTC 

-- sum :: Int -> Int
-- sum x = (x * (x+1))/2

-- sum2 :: Int -> Int
-- sum2 n = if n == 0 then 0 else n + sum2 ( n - 1)

-- sum3 :: Int -> Int -> Int
-- sum3 x y = if y == x then x else (y + (sum3 x ( y - 1 )))

-- sum3 :: Int -> Int -> Int
-- sum3 x y = if y > 0 then (y + (sum3 x ( y - 1))) else 0

-- fibonacci :: Int -> Int
-- fibonacci n = if (n == 0) then 0 else if (n == 1) then 1 else fibonacci (n - 2) + fibonacci (n - 1)

