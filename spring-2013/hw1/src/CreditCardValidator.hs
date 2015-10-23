module CreditCardValidator (toDigits, toDigitsRev) where

toDigits :: Integer -> [Integer]
toDigits = map readChar . show

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

readChar :: Read c => Char -> c
readChar = read . (:[])
