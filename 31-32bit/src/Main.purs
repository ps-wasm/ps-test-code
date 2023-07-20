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

--som :: forall a. Semiring a => a -> a -> a
--som x y = x + y

plusIets :: Int -> Int
plusIets x = if (x==0)
             then 0 
             else x+2
