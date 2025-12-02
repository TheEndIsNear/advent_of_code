module Main where

import Test.HUnit

import Lib (run)

main :: IO ()
main = do
  counts <- runTestTT tests
  if errors counts + failures counts == 0
    then putStrLn "All good – password is 3!"
    else error "Test failed"

tests :: Test
tests = TestList
  [ TestLabel "input.txt should give 3" testRealInput
  ]

testRealInput :: Test
testRealInput = TestCase $ do
  result <- run "test/input.txt"
  assertEqual "Password should be 3" 3 result
