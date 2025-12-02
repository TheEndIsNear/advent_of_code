module Main (main) where

import Lib

main :: IO ()
main = do
  count <- run "input.txt"
  print count
