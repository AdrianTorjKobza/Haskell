
module Lib
    ( grid
    , languages
    , formatGrid
    , formatLanguages
    , outputGrid
    , outputLanguages
    , findWord
    , findWords
    , findWordInLine
    , formatWords
    , outputWords
    ) where

import Data.List (isInfixOf) -- Checks if the first list is contained in the second list
import Data.Maybe (catMaybes) -- Takes a list of "Maybes" and returns a list of "Just" values

-- The grid where we are going to search for the words
grid = [ "__C________R___"
       , "__SI________U__"
       , "__HASKELL____B_"
       , "__A__A_____S__Y"
       , "__R___B___C____"
       , "__PHP____H_____"
       , "____S_LREP_____"
       , "____I__M_Y__L__"
       , "____L_E__T_O___"
       , "_________HB____"
       , "_________O_____"
       , "________CN_____"
       ]

-- The words that are going to be searched in the grid
languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ] 

-- Map the DataType [String] to Grid
type Grid = [String]

-- It joins lines, after appending a terminating newline to each
formatGrid :: Grid -> String
formatGrid = unlines -- Displays the grid as seen above, adding a newline after comma

-- Prints the grid
outputGrid :: Grid -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

-- It joins lines, after appending a terminating newline to each
formatLanguages :: [String] -> String
formatLanguages = unlines -- Displays the languages as seen above, adding a newline after comma

-- Prints the list of languages
outputLanguages :: [String] -> IO ()
outputLanguages languages = putStrLn (formatLanguages languages)

-- Checks if a word is in a list
findWordInLine :: String -> String -> Bool
findWordInLine = isInfixOf -- Returns True if the word is in the list

-- Search the word in the grid
findWord :: Grid -> String -> Maybe String
findWord grid word = 
     let lines = grid ++ (map reverse grid) -- "lines" now contains the initial grid + the grid in reverse
         found = or $ map (findWordInLine word) lines -- Maps findWordInLine func to each line from "lines" 
     in if found then Just word else Nothing -- Returns a list of the words found or "Nothing"

-- Returns the list of words found in grid
findWords :: Grid -> [String] -> [String]
findWords grid words =
     let foundWords = map (findWord grid) words -- Maps the findWord func to each list element
     in catMaybes foundWords -- Returns only the list of words found in the grid. "Nothing" is removed

-- It joins lines, after appending a terminating newline to each
formatWords :: [String] -> String
formatWords = unlines -- Displays the words, adding a newline after comma

-- Prints the list of words found in grid
outputWords :: [String] -> IO ()
outputWords languages = putStrLn (formatWords (findWords grid languages))
