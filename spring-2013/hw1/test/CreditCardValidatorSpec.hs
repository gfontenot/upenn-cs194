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
            