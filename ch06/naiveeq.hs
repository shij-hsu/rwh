-- file: ch06/naiveeq.hs

data Color = Red | Green | Blue

colorEq :: Color -> Color -> Bool
colorEq Red Red = True
colorEq Blue Blue = True
colorEq Green Green = True
colorEq _ _ =False


stringEq :: [Char]->[Char]->Bool
stringEq [] [] =True
stringEq (x:xs) (y:ys) = x==y && stringEq xs ys
stringEq _ _ = False

instance Show Color where
  show Red = "Color: Red"
  show Blue = "Color: Blue"
  show Green = "Color: Green"


instance Read Color where
  -- readsPrec is the main function for parsing input
  readsPrec _ value =
    tryParse [("Red",Red),("Green",Green),("Blue",Blue)]
    where
      tryParse [] = []
      tryParse ((attempt, result):xs) =
        if (take (length attempt) value) == attempt
          then [(result,drop (length attempt) value)]
          else tryParse xs
