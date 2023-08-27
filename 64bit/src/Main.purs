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

---------------------------------------------------------------------------------------
---------------------------------- NEW ------------------------------------------------
---------------------------------------------------------------------------------------

---- Concrete types ----

-- parameter toevoegen en één keer aanroepen
-- sum1 :: Number -> Number
-- sum1 x = (x * (x + 1.0)) / 2.0
-- -- kleine invloed
-- sum2 :: Number -> Number -> Number
-- sum2 z x = ((z + x) * (x - z + 1.0)) / 2.0
-- -- opmerking 
-- -- sum1 =~ sum2 0

-- -- -- parameter toevoegen en elke keer aanroepen
-- sum3 :: Number -> Number
-- sum3 x = if x == 0.0 then x else x + sum3 (x - 1.0)
-- -- grote invloed
-- sum4 :: Number -> Number -> Number
-- sum4 z x = if x == z then z else x + sum4 z (x - 1.0)
-- -- opmerking
-- -- sum3 =~sum4 0
-- sum5 :: Number -> Number -> Number
-- sum5 x a = if x == 0.0 then a else sum5 (x - 1.0) (a + x)
-- -- sum5 niet met sum3, want: extra parameter!
-- -- verwachting: sum5 sneller dan sum4, want staartrecursie 

-- ---- polymorfe types ----

-- -- parameter toevoeen en één keer aanroepen
-- sum1TC :: forall a. EuclideanRing a => a -> a
-- sum1TC x = (x * (x + one)) / (one + one)
-- -- kleine invloed
-- sum2TC :: forall a. EuclideanRing a => a -> a -> a
-- sum2TC z x = ((z + x) * (x - z + one)) / (one + one)
-- --opmerking sum1' =~sum2' zero

-- -- test1000 = sum1' 1000
-- -- test1000 = sum2' zero 1000

-- -- parameter toevoegen en elke keer aanroepen
-- sum3TC :: forall a. EuclideanRing a => Ord a => a -> a
-- sum3TC x = if x == zero then x else x + sum3TC (x - one)
-- -- grote invloed
-- sum4TC:: forall a. EuclideanRing a => a -> a -> a
-- sum4TC z x = if x == z then z else x + sum4TC z (x - one)
-- -- opmerking
-- -- sum3' =~ sum4' zero

-- -- test1000 = sum3' 1000
-- -- test1000 = sum4' zero 1000

-- sum5TC:: forall a. EuclideanRing a => a -> a -> a
-- sum5TC x a = if x == zero then a else sum5TC (x - one) (a + x)
--sum5' niet met sum3', want: extra parameter
-- verwachting: sum5' sneller dan sum4', want staartrecursie

-- ---- 1 wordt one en 0 wordt zero ----

-- sum2 :: Number -> Number -> Number
-- sum2 z x = ((z + x) * (x - z + one)) / (one + one)

sum4 :: Number -> Number -> Number
sum4 z x = if x == z then z else x + sum4 z (x - one)

-- sum2TC :: forall a. EuclideanRing a => a -> a -> a
-- sum2TC z x = ((z + x) * (x - z + 1)) / (1 + 1)

-- sum4TC:: forall a. EuclideanRing a => a -> a -> a
-- sum4TC z x = if x == z then z else x + sum4TC z (x - 1)

---------------------------------------------------------------------------------------
---------------------------------- OLD ------------------------------------------------
---------------------------------------------------------------------------------------

-- sumWithTC :: forall a. EuclideanRing a => a -> a -> a
-- sumWithTC x y = (x * x + x) / y

-- sumWithTCNumber :: Number -> Number -> Number
-- sumWithTCNumber = sumWithTC 

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


