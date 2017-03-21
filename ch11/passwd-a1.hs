-- file: ch13/passwd-a1.hs

import Data.List
import System.IO
import Control.Monad(when)
import System.Exit
import System.Environment (getArgs)

main = do
  -- Load the command-line arg
  args<-getArgs

  when (length args /= 2) $ do
    putStrLn "Syntax: passwd-a1 filename uid"
    exitFailure

  content <- readFile (args !! 0)

  let username = findByUID content (read (args !! 1))

  case username of
    Just x -> putStrLn x
    Nothing -> putStrLn "Could not find that UID"


findByUID :: String -> Integer -> Maybe String
findByUID content uid =
  let a1 = map parseline . lines $ content
    in lookup uid a1

parseline :: String -> (Integer, String)
parseline input =
  let fields = split ':' input
    in (read (fields !! 2), fields !! 0)

split :: Eq a => a->[a]->[[a]]
split _ [] = [[]]
split delimiter str =
  let (before, remainder) = span (/=delimiter) str
    in before : case remainder of
      [] -> []
      x -> split delimiter (tail x)
