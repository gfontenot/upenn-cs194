module HanoiSpec (main, spec) where

import Test.Hspec
import Hanoi

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "hanoi" $ do
        it "solves the puzzle" $
            hanoi 2 "a" "b" "c" `shouldBe` [("a","c"), ("a","b"), ("c","b")]
