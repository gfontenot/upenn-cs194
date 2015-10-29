module CreditCardValidatorSpec (main, spec) where

import Test.Hspec
import CreditCardValidator

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "toDigits" $ do
        it "returns the digits as a list" $
            toDigits 12345 `shouldBe` [1, 2, 3, 4, 5]
        it "returns an empty list for negative numbers" $
            toDigits (-17) `shouldBe` []
        it "returns an empty list for 0" $
            toDigits 0 `shouldBe` []

    describe "doubleEveryOther" $ do
        it "doubles every other digit in a list from the right" $ do
            doubleEveryOther [1, 2, 3] `shouldBe` [1, 4, 3]
            doubleEveryOther [8,7,6,5] `shouldBe` [16,7,12,5]

    describe "sumDigits" $ do
        it "returns the sum of every digit in the list" $
            sumDigits [16,7,12,5] `shouldBe` 22

    describe "validate" $ do
        it "validates a credit card number" $ do
            validate 4012888888881881 `shouldBe` True
            validate 4012888888881882 `shouldBe` False
