module Main where

import System.Environment
import System.IO
import Data.List
import Lib

add :: IO ()
add = putStrLn "TBD"

testWords :: IO ()
testWords = do
    withFile "words.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        print . getVocab $ lines contents)


dispatch :: [(String, IO ())]
dispatch = [ ("add", add)
           , ("test", testWords)
           ]

main :: IO ()
main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action
