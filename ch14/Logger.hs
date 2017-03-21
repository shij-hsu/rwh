--  file: ch14/Logger.hs

globToRegex :: String -> Logger String

module Logger
    (
      Logger
    , Log
    , runLogger
    , record
    ) where

type Log = [String]
runLogger :: Logger a -> (a, Log)
