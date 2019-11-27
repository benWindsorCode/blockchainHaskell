module Main where

import Data.Time.Clock
import Lib

-- Here we test the addition of a block to the chain out of sequence
-- We assert the initial two blocks are legitimate
-- We then assert the final block is not legitimate
main :: IO ()
main = do
    time <- getCurrentTime
    time2 <- getCurrentTime
    let chain = addBlock (addBlock [] "newVal" time) "secondVal" time2
    let fakeChainToAdd = addBlock [] "fakeVal" time
    let augmentedChain = chain ++ fakeChainToAdd
    putStrLn $ show chain
    putStrLn $ show $ isBlockValid (augmentedChain !! 0) (augmentedChain !! 1)
    putStrLn $ show $ isBlockValid (augmentedChain !! 1) (augmentedChain !! 2)