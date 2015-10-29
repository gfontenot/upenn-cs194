module CreditCardValidator
    ( toDigits
    , doubleEveryOther
    , sumDigits
    , validate
    ) where

toDigits :: Integer -> [Integer]
toDigits n
    | n <= 0 = []
    | otherwise = map readChar $ show n
    where readChar = read . (:[])

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1, 2]) . reverse

sumDigits :: [Integer] -> Integer
sumDigits = sum . (toDigits =<<)

validate :: Integer -> Bool
validate = checkRemainder . sumDigits . doubleEveryOther . toDigits
    where checkRemainder = (== 0) . (`mod` 10)
