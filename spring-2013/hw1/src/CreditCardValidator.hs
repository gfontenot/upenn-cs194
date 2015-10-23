module CreditCardValidator (toDigits) where

toDigits :: Integer -> [Integer]
toDigits = map readChar . show

readChar :: Read c => Char -> c
readChar = read . (:[])
