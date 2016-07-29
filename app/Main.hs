module Main where

import System.Environment
import System.IO
--import System.Random
--import System.Random.Shuffle
import Data.List
import Vocab

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
           , ("startTest", startTest)
           ]

add :: IO ()
add = putStrLn "TBD"

startTest :: IO ()
startTest = do
    withFile "words.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        mapM_ askWord $ getWordsBatchForTest contents 5)

askWord :: VocabEntry -> IO ()
askWord (VocabEntry {english=en, italian=it}) = do
    putStrLn ("Translate word " ++ it)


printHelp :: IO ()
printHelp = do
    putStr "smart-vocab - Vocabulary trainer\n\n"
    putStr "Usage: smart-vocab COMMAND\n\n"
    putStrLn "Available commands:"
    putStrLn "  add         Add new words to vocabulary"
    putStrLn "  startTest        Start vocabulary tests"
