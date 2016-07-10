module Lib
    ( getVocab
    ) where

import Data.Strings

data VocabEntry = VocabEntry { english :: String
                             , italian :: String
                             } deriving (Show)

toVocabEntry :: [String] -> VocabEntry
toVocabEntry (enWord:itWord:tail) = VocabEntry {english=enWord, italian=itWord}

splitBySemicolon :: String -> [String]
splitBySemicolon = strSplitAll ";"

getVocab :: [String] -> [VocabEntry]
getVocab entries = map toVocabEntry $ map splitBySemicolon entries
