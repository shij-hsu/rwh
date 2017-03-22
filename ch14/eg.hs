-- eg.1

main = do
  str <- getLine
  putStrLn str


wordCount = print . length . words =<< getContents
{-
main1 =
  let f str = putStrLn str
      f _ = fail "..."
  in getLine >>= f


main =
  let f str = putStrLn str
      f _ = fail "..."
  in getLine >>= f

-}
