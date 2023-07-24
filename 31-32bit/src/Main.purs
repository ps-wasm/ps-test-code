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

-- som :: Int -> Int -> Int
-- som x y = x + (som x (y - 1))

-- som :: Int -> Int -> Int
-- som x y = if y > 0 then (x + y + (som x (y - 1))) else x

--som :: forall a. Semiring a => a -> a -> a
--som x y = x + y

-- sum :: Int -> Int
-- sum x = (x * (x+1))/2

-- sum2 :: Int -> Int
-- sum2 n = if n == 0 then 0 else n + sum2 ( n - 1)

-- with start, end and accumelator parameters
-- sum3 :: Int -> Int -> Int
-- sum3 x y = if y > 0 then (x + y + (sum3 x ( y - 1))) else x

sum3 :: Int -> Int -> Int
sum3 x y = if y == 0 then x else (x + y + sum3 x ( y - 1))

-- fibonacci :: Int -> Int
-- fibonacci n = if (n == 0) then 0 else if (n == 1) then 1 else fibonacci (n - 2) + fibonacci (n - 1)

-- plusIets :: Int -> Int
-- plusIets x = if (x==0)
--              then 0 
--              else x+2
