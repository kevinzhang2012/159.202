-- Yuxiang Zhang 13158665
-- Gary Zhang 12228309

import Data.Char

-- Exercise 1
-- (a)
-- 3^234
-- 59702569

-- (b)
-- product [1..600]
-- 1409

-- (c)
-- mod 5 8 - div 13 4
-- 2

-- "FUN" ++ "THOMAS"
-- "FUNTHOMAS"

-- 1+5/7 == 12/7
-- false

-- (d)
-- :m Data.Char
-- chr 100
-- 'd'

-- ord 'Q'
-- 81

---------------------------------------------------------
-- Exercise 2
-- (a)
sum2a :: Float -> Float
sum2a n = ((n+1)/2*n)^2    -- uses formula provided

-- (b)
sum2b :: Float -> Float
sum2b n
 |n == 0 = 0
 |otherwise  = n^3 + sum2b (n-1)   -- uses guards and recursion

-- (c)
sum2c :: Float -> Float
sum2c 0 = 0
sum2c n = n^3 + sum2c(n-1)   -- uses patterns and recursion

-- (d)
-- Solution in (a) is most run-time effcient, as it uses a single expression to caculate sum, while (b) and (c) need to repeat function number of times.

---------------------------------------------------------
-- Exercise 3
-- (a)
f :: Char -> Int
f x
 |(ord x)>=48 && (ord x)<=57   = ord x - 48   -- to range 0-9
 |(ord x)>=65 && (ord x)<=70   = ord x - 55   -- to range A-F
 |(ord x)>=97 && (ord x)<=102  = ord x - 87   -- to range a-f
 |otherwise = error "ERROR! Please Enter 0-9 a-f A-F"   -- output error message if not within above ranges
 
-- (b)
netEarning :: Float -> Float
netEarning n
 |n<=14000 = n*0.895   -- base
 |n<=48000 = (n-14000)*0.825 + netEarning 14000
 |n<=70000 = (n-48000)*0.70 + netEarning 48000
 |n>70000  = (n-70000)*0.67 + netEarning 70000
 
 ---------------------------------------------------------
 --Exercise 4
-- (a)
gcdD :: Int -> Int -> Int
gcdD x y
 |x==y = x
 |x>y = gcdD (x-y) y
 |otherwise = gcdD x (y-x)
 
-- (b)
pow :: Int -> Int -> Int
pow n k
 |even k == True = (n^2)^(div k 2)
 |otherwise = n*(n^(k-1))
