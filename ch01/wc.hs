-- file: ch01/wc.hs
main = interact wordCount
  where
    wordCount input = show (length (lines input))++"\n"
