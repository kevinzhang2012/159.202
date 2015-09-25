-- 159.202 Assignment 4
-- Yuxiang Zhang 13158665
-- Gary Zhang 12228309
--------------------------------------------------------------------
-- Exercise 1
--(a)
time :: Int -> (Int, Int, Int)
time x = (div x 3600, div (mod x 3600) 60, mod x 60)

--(b)
type Point = (Int, Int)
type Line  = (Int, Int, Int)
onLine :: Point -> Line -> Bool
onLine (x,y) (a,b,c) = a*x + b*y + c == 0

--------------------------------------------------------------------
-- Exercise 2
-- (a)
powFr :: (Int, Int) -> Int -> String
powFr (n,d) x = (show (div (n^x) y)) ++ "/" ++ (show (div (d^x) y)) ++ "\n"
   where y = gcd (n^x) (d^x)

-- (b)
(%%) :: (Int, Int) -> (Int, Int) -> Bool
(a1, b1) %% (a2, b2) = a1==b2 && b1==a2
infix 3 %%

--------------------------------------------------------------------
-- Exercise 3
-- (a)
prod :: [Int] -> [Int] -> Int
prod a b |length a /= length b = error "Lists have different size."
prod [] [] = 1                      -- Recursive base
prod (ha:ta) (hb:tb)
 |mod ha hb == 0 = ha* (prod ta tb) -- When ha is divisible by hb
 |otherwise = prod ta tb            -- When ha is NOT divisible by hb

-- (b)
magic :: [Int] -> (Int, [Int])
magic nList = (m, rest)
 where m = snd smallNum
       rest = take ((fst smallNum)-1) nList ++ drop (fst smallNum) nList
       smallNum = smallest nList

smallest :: [Int] -> (Int, Int) -- a function to find smallest number in list
smallest []     = error"ERROR! List is empty."
smallest [x]    = (1, x)
smallest (x:xs) 
 |x< snd next   = (1,x)
 |otherwise     = ((fst next) + 1, snd next)
 where next = smallest xs

-- (c)
total :: [[Int]] -> Int
total []     = 0
total (x:xs) = sum x + total xs

--------------------------------------------------------------------
-- Excercise 4
-- (a)
sOdd1 :: [Int] -> [Int]
sOdd1 []      = []
sOdd1 [_]     = []
sOdd1 (h:t)  = num ++ sOdd1 t
  where num = if odd h then [head t] else []   -- Return the digit followed by odd number

-- (b)
sOdd2 :: [Int] -> [Int]
sOdd2 x
 | length x < 2 = []
 | otherwise    =  num ++ sOdd2 (tail x)
  where num = if odd (head x) then [x !! 1] else []
 
-- (c) 
sOdd3 :: [Int] -> [Int]
sOdd3 x = [x !! (i + 1) | i <- [0..((length x) - 2)], odd (x !! i)]