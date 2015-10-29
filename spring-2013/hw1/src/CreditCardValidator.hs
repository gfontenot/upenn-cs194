module CreditCardValidator (toDigits, toDigitsRev, doubleEveryOther, sumDigits) where

toDigits :: Integer -> [Integer]
toDigits n
    | n <= 0 = []
    | otherwise = map readChar . show $ n

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1, 2]) . reverse

sumDigits :: [Integer] -> Integer
sumDigits = sum . (toDigits =<<)

readChar :: Read c => Char -> c
readChar = read . (:[])
