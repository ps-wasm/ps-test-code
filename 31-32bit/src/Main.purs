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
---------------------------------------------------------------------------------------
---------------------------------- NEW ------------------------------------------------
---------------------------------------------------------------------------------------

---- Concrete types ----

-- parameter toevoegen en één keer aanroepen
-- sum1 :: Int -> Int
-- sum1 x = (x * (x + 1)) / 2
-- -- kleine invloed
-- sum2 :: Int -> Int -> Int
-- sum2 z x = ((z + x) * (x - z + 1)) / 2
-- -- opmerking 
-- -- sum1 =~ sum2 0

-- -- -- parameter toevoegen en elke keer aanroepen
-- sum3 :: Int -> Int
-- sum3 x = if x == 0 then x else x + sum3 (x - 1)
-- -- grote invloed
-- sum4 :: Int -> Int -> Int
-- sum4 z x = if x == z then z else x + sum4 z (x - 1)
-- -- opmerking
-- -- sum3 =~sum4 0
-- sum5 :: Int -> Int -> Int
-- sum5 x a = if x == 0 then a else sum5 (x - 1) (a + x)
-- -- sum5 niet met sum3, want: extra parameter!
-- -- verwachting: sum5 sneller dan sum4, want staartrecursie 

-- ---- polymorfe types ----

-- -- parameter toevoeen en één keer aanroepen
-- sum1TC :: EuclideanRing a => a -> a
-- sum1TC x = (x * (x + one)) / (one + one)
-- -- kleine invloed
-- sum2TC :: EuclideanRing a => a -> a -> a
-- sum2TC z x = ((z + x) * (x - z + one)) / (one + one)
-- --opmerking sum1' =~sum2' zero

-- -- test1000 = sum1' 1000
-- -- test1000 = sum2' zero 1000

-- -- parameter toevoegen en elke keer aanroepen
-- sum3TC :: EuclideanRing a => a -> a
-- sum3TC x = if x == zero then x else x + sum3TC (x - one)
-- -- grote invloed
-- sum4TC:: EuclideanRing a => a -> a -> a
-- sum4TC z x = if x == z then z else x + sum4TC z (x - one)
-- -- opmerking
-- -- sum3' =~ sum4' zero

-- -- test1000 = sum3' 1000
-- -- test1000 = sum4' zero 1000

-- sum5TC:: EuclideanRing a => a -> a -> a
-- sum5TC x a = if x == zero then a else sum5TC (x - one) (a + x)
--sum5' niet met sum3', want: extra parameter
-- verwachting: sum5' sneller dan sum4', want staartrecursie

---------------------------------------------------------------------------------------
---------------------------------- OLD ------------------------------------------------
---------------------------------------------------------------------------------------

-- somMetTC :: forall a. EuclideanRing a => a -> a -> a
-- somMetTC x y = x + y

-- somInt :: Int -> Int -> Int
-- somInt = somMetTC

-- somGeenTC :: Int -> Int -> Int 
-- somGeenTC x y = x + y

-- sumWithTC :: forall a. EuclideanRing a => a -> a -> a
-- sumWithTC x y = (x * x + x) / y

-- sumWithTCInt :: Int -> Int -> Int
-- sumWithTCInt = sumWithTC 

-- sum :: Int -> Int
-- sum x = (x * (x+1))/2

-- sum2 :: Int -> Int
-- sum2 n = if n == 0 then 0 else n + sum2 ( n - 1)

-- sum3 :: Int -> Int -> Int
-- sum3 x y = if y > 0 then (y + (sum3 x ( y - 1))) else 0

-- fibonacci :: Int -> Int
-- fibonacci n = if (n == 0) then 0 else if (n == 1) then 1 else fibonacci (n - 2) + fibonacci (n - 1)

-- sumTest :: forall a. EuclideanRing a => a -> a -> a
-- sumTest x y = x + y + (x + (y - x)) + (x + (y - x))

-- sumTestInt :: Int -> Int -> Int
-- sumTestInt = sumTest

