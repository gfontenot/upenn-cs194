module CreditCardValidator (toDigits, toDigitsRev, doubleEveryOther) where

toDigits :: Integer -> [Integer]
toDigits xs
    | xs <= 0 = []
toDigits xs = map readChar . show $ xs

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

readChar :: Read c => Char -> c
readChar = read . (:[])

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1, 2]) . reverse
