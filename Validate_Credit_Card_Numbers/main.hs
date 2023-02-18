-- Convert the credit card numbers into a list of digits.
toDigits :: Integer -> [Integer]
toDigits n
     | n <= 0 = [] -- Filter invalid credit card numbers. 
     | otherwise = toDigits (n `div` 10) ++ [n `mod` 10] -- Build the list of digits. Ex: [3] ++ [6] ++ ... ++ [1].


-- Reverse the list of digits.
toDigitsRev :: Integer -> [Integer]
toDigitsRev xs = (reverse . toDigits) xs


-- Double every second digit from the list
doubleSecond :: [Integer] -> [Integer]
doubleSecond [] = []
doubleSecond (x:[]) = [x] -- Handle the case when the length of the number is not even.
doubleSecond (x:y:xs) = x:(2*y):doubleSecond xs


-- Every double digit from the list is broken into single digits. Ex: [1,12,4,18] -> [1,1,2,4,1,8]
-- Sum all the single digits from the list.
sumDigits :: [Integer] -> Integer
sumDigits [] = 0 -- Edge condition, when we reach the end of the list.
sumDigits (x:xs) = (x `mod` 10) + (x `div` 10) + sumDigits xs 


-- Validate the credit card number. Return True if valid, else False.
isValid :: Integer -> Bool
isValid x = if (sumDigits $ doubleSecond $ toDigitsRev x) `mod` 10 == 0 then True else False
