module Main where

import Data.Time.Clock
import Lib

main :: IO ()
main = do
    time <- getCurrentTime
    time2 <- getCurrentTime
    putStrLn $ show $ addBlock (addBlock [] "newVal" time) "secondVal" time2