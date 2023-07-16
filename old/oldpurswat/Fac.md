# How to implement a factorial function in our compiler #

When we started building our compiler we knew we needed to test it. We knew we even had to make tests to not only test our artefact but also the output created by our compiler versions. It was pretty straightforward for us to pick two metrics in which we wanted our output to be tested at. First one beign code size and the other one execution speed.

## Add all numbers from 1 to ..... ## 
The reason for these two measurements is that they address two features mentioned on the main website from WebAssembly. Fast and reliable and compact. To test execution speed you need a program that does some calculation. It is even better to have it make a long and heavy calculation. The reason for this is to see notable differences between the effectiveness of the different generated webassembly output.

We started with some simple calculations which we could us for this test. As we implemented the basic operation addition first, we added six ways to sum all ascending numbers up untill a certain chosen number. Only one of these calculations used only the basic operation addition.

```
--with addition, subtraction and case
sum :: Int -> Int
sum 0 = 0
sum x = x + sum (x - 1)
```

```
--with sum from PureScript prelude
sum :: Int -> Int
sum x = sum x
```

```
--with start, end, addition, subtraction, lesser than, greater than, accumulator, and case
sum :: Int -> Int -> Int -> Int
sum x y z | y < 0 = 0
          | y > 0 = sum (x + y) (y - 1)
          | otherwise = x
```
```
--with addition, subtraction, multiplication, and division
sum :: Int -> Int
sum x - (x * (x + 1)) /2
```

```
--with equality, lesser than, greater than, addition, and case
sum :: Int -> Int -> Int -> Int
sum x y z | x == y = z + y
          | x < y = sum (x + 1) y (z + x)
          | otherwise = 0
```

```
--with if else, addition, equality (non-equality), subtraction, and addition
sum :: Int -> Int
sum x = if (x /= 0) then x + sum (x - 1) else x
```

This was for us a reason to implement more basic calulation operations. We started with the addition of multiply, and division. Now we could do another version of this calculation. https://letstalkscience.ca/educational-resources/backgrounders/gauss-summation. Now we could use the gauss summation to do the same

We also wanted to use an acc to create the same calculation but then we needed the logical operations: lesser than, greater than and equal. So we implemented these operations next. Now we had multiple ways to calculate this problem and we can make multiple tests to check the performance. If we wanted tougher calculations we just entered higher numbers. The only thing we needed to check is the right output created by these generated webassembly programs. 

## Let us take our webassembly more to the limit ##
To let our Webassembly programs do harder, tougher calculations we wanted to implement a factorial function and a Fibonnaci function. To implement these two functions we needed something we did not have already. We needed a case statement. Even though we tried it seemed it was to difficult and time consuming to implement a case statement. So we rewrote the factorial function without a case in purescript:

```
fac ::  Int -> Int
fac n = if (n == 0) then 1 else (n * fac (n - 1))
```

But when compiling this to the intermediate language by the PureScript compiler it translates it to a intermediate tree with a case statement. We could have gone two ways: 1. We put more effort in the implementation of a case statement or 2. Instead of a case statement we could seperate the different case alternatives and implement them seperated from each other. This last option was suggested by our research supervisor. 


