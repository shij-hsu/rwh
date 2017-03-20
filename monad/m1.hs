-- Defineing a safe division operator

x//y =
  x >>= (\a ->
    y >>= (\b ->
      if b == 0 then Nothing else Just (a/b)))


x \\ y =
  do
    mx <- x
    my <- y
    return (mx + my)


main :: IO()

main = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Nice to meet you, "++name++"!")
