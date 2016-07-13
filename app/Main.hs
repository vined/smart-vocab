module Main where

import System.Environment
import System.IO
import Data.List
import Lib

main :: IO ()
main = do
    args <- getArgs
    if null args
        then printHelp
        else callAction . lookup (head args) $ dispatch

callAction :: Maybe (IO ()) -> IO ()
callAction (Just action) = action
callAction Nothing = printHelp

dispatch :: [(String, IO ())]
dispatch = [ ("add", add)
           , ("test", testWords)
           ]

add :: IO ()
add = putStrLn "TBD"

testWords :: IO ()
testWords = do
    withFile "words.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        print . getVocab $ lines contents)

printHelp :: IO ()
printHelp = do
    putStr "smart-vocab - Vocabulary trainer\n\n"
    putStr "Usage: smart-vocab COMMAND\n\n"
    putStrLn "Available commands:"
    putStrLn "  add         Add new words to vocabulary"
    putStrLn "  test        Start vocabulary tests"
