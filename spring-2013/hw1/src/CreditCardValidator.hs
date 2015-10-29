module CreditCardValidator
    ( toDigits
    , toDigitsRev
    , doubleEveryOther
    , sumDigits
    , validate
    ) where

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

validate :: Integer -> Bool
validate = checkRemainder . sumDigits . doubleEveryOther . toDigits

checkRemainder :: Integral a => a -> Bool
checkRemainder = (== 0) . (`mod` 10)

readChar :: Read c => Char -> c
readChar = read . (:[])
