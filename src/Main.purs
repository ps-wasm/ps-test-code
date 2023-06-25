module Main
  where

import Wasm.Semiring
import Wasm.Ring
import Wasm.EuclideanRing


--f :: Int -> Int -> Int
--f x y = x * (y + 1)

--r :: Int
--r = 10

--q :: Int
--q = r + (3 * 4)

--som :: Int -> Int
--som x = x + 6

--myAdd :: Int -> Int -> Int
--myAdd x y = x + y

--tripleAdd :: Int -> Int -> Int -> Int
--tripleAdd x y z = x + y + z

--myCalc :: forall a. Semiring a => a -> a -> a
--myCalc x y = x + y * y

--t :: Int
--t = (myCalc 3 4)

--data Patat = Normaal String | Groot String

--zw :: forall a b c. (a -> b -> c) -> a -> b -> c
--zw k x y = k x y

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

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)
{-



fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 2) + fibonacci (n - 1)


sum :: Int -> Int
sum x = (x * (x+1))/2
-}
--polyConst :: forall a. TestClass a => a
--polyConst = testGb

--fromString :: String -> Boolean
--fromString "true" = true
--fromString _      = false

--tja :: Boolean -> Boolean -> String
--tja true true = "superwaar"
--tja true _    = "waar"
--tja _ _       = "onwaar"

--m :: Array Int
--m = [1]

--youKnow = map (\z -> z + 2) m


--som :: forall a. Semiring a => a -> a -> a
--som x y = x + y

--mapTest :: Array Int -> Array Int
--mapTest x = map som x

--myAdd :: Int -> Int -> Int
--myAdd x y = x + y

--getal :: Int
--getal = waitingAdd 10

--waitingAdd :: Int -> Int
--waitingAdd = tripleAdd 3 4

--tripleAdd :: Int -> Int -> Int -> Int
--tripleAdd x y z = x + y + z

--u :: Int -> Int -> Int -> Int
--u x y z = (g z) (g y x)

--p :: Int -> Int
--p = g 2

{-
pop :: Int -> Int
pop x = x + a + b
  where  a = 5
         b = a * x

-}
-- even = filter (\n -> (n `mod` 2) == 0) (range 10 88)
--even :: Boolean
--even = 9 == 8

--isEven :: Int -> Boolean
--isEven x = even x
--  where even a = a `mod` 2 == 0

{-
family :: String -> String -> String
family x y = show (x <> " is familie van " <> y) 

fac :: Int -> Int
fac 0 = 1
fac x = x * fac (x-1)
-}