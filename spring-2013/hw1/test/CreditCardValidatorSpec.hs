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
        digitParserSharedBehavior toDigits

    describe "toDigitsRev" $ do
        it "returns the digits as a list in reverse order" $
            toDigitsRev 12345 `shouldBe` [5, 4, 3, 2, 1]
        digitParserSharedBehavior toDigitsRev

    describe "doubleEveryOther" $ do
        it "doubles every other digit in a list from the right" $ do
            doubleEveryOther [1, 2, 3] `shouldBe` [1, 4, 3]
            doubleEveryOther [8,7,6,5] `shouldBe` [16,7,12,5]

    describe "sumDigits" $ do
        it "returns the sum of every digit in the list" $
            sumDigits [16,7,12,5] `shouldBe` 22

digitParserSharedBehavior :: (Integer -> [Integer]) -> SpecWith ()
digitParserSharedBehavior f =  do
        it "returns an empty list for negative numbers" $
            f (-17) `shouldBe` []
        it "returns an empty list for 0" $
            f 0 `shouldBe` []
