module Main where

import Lib

main :: IO ()
main = do
     putStrLn "===== The GRID ====="
     putStrLn " "
     outputGrid grid
     putStrLn " "
     putStrLn "===== The list of LANGUAGES ====="
     putStrLn " "
     outputLanguages languages
     putStrLn " "
     putStrLn "===== The words found in the GRID ====="
     putStrLn " "
     outputWords languages
