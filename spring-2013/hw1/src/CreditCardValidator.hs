module CreditCardValidator (toDigits, toDigitsRev, doubleEveryOther) where

toDigits :: Integer -> [Integer]
toDigits n
    | n <= 0 = []
    | otherwise = map readChar . show $ n

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

readChar :: Read c => Char -> c
readChar = read . (:[])

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1, 2]) . reverse
