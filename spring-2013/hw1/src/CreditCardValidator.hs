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
doubleEveryOther [] = []
doubleEveryOther (x:[]) = [x]
doubleEveryOther xs = doubleEveryOther (init . init $ xs) ++ [2 * (last . init $ xs)] ++ [last xs]
