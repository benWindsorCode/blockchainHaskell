module Lib
    ( 
        addBlock,
        isBlockValid,
        Block
    ) where

import Data.Time.Clock
import Data.Hashable

type Hash = Int
-- A class to represent an object which can be hashed
-- class Hashable a where
--     hash :: a -> Hash

data Block = Block {
    currentHash :: Int,
    prevHash :: Int,
    value :: String,
    timestamp :: UTCTime
} deriving (Show)

addBlock :: [Block] -> String -> UTCTime -> [Block]
addBlock blocks@(x:xs) value timestamp = blocks ++ [(Block newHash prevHash value timestamp)]
    where
        prevHash = currentHash $ last blocks
        newHash = hashBlockData prevHash value timestamp
addBlock [] value timestamp = [] ++ [(Block newHash initialHash value timestamp)]
    where
        initialHash = 0
        newHash = hashBlockData initialHash value timestamp

isBlockValid :: Block -> Block -> Bool
isBlockValid prevBlock nextBlock = (prevHash nextBlock) == (currentHash prevBlock)

-- Use the prev hash, value and timestamp to create a hash for the current block 
hashBlockData :: Int -> String -> UTCTime -> Int
hashBlockData prevHash value timestamp = hash ((show prevHash) ++ value ++ (show timestamp))