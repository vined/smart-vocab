module Vocab
    ( VocabEntry(..)
    , getVocab
    , getWordsBatchForTest
    ) where

import Data.Strings

data VocabEntry = VocabEntry { english :: String
                             , italian :: String
                             } deriving (Show)

toVocabEntry :: [String] -> VocabEntry
toVocabEntry (enWord:itWord:tail) = VocabEntry {english=enWord, italian=itWord}

splitBySemicolon :: String -> [String]
splitBySemicolon = strSplitAll ";"

getVocab :: String -> [VocabEntry]
getVocab unparsedVocab = map toVocabEntry . map splitBySemicolon . drop 1 $ lines unparsedVocab

getWordsBatchForTest :: String -> Int -> [VocabEntry]
getWordsBatchForTest unparsedVocab wordsCount = take wordsCount $ getVocab unparsedVocab
