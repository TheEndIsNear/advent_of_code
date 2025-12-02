{-# LANGUAGE OverloadedStrings #-}

module Lib
    (run,
    parseLine
    ) where

import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

run :: FilePath -> IO Int
run path = do
  directions <- map parseLine . T.lines <$> TIO.readFile path
  let initial = (0, 50) -- sets the count to start at 0 and the initial position of 50
      (count, _) = foldl' step initial directions
  pure count

step :: (Int, Int) -> (Char, Int) -> (Int, Int)
step (count, value) (dir, n) = updateState (count, newValue)
  where
    newValue = processCommand (dir, n) value

parseLine :: Text -> (Char, Int)
parseLine line = (T.head line, read ( T.unpack (T.tail line)) :: Int)

processCommand :: (Char, Int) -> Int -> Int
processCommand (dir, n) value
  | dir == 'L' = (value - n) `mod` 100
  | dir == 'R' = (value + n) `mod` 100
  | otherwise = error $ "Invalid command" ++ show dir

updateState :: (Int, Int) -> (Int, Int)
updateState (count, 0) = (count + 1, 0)
updateState (count, value) = (count, value)
