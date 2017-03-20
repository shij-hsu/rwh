import Test.QuickCheck
import Data.List

qsort :: Ord a => [a]->[a]
qsort [] = []
qsort (x:xs) = qsort lhs ++ [x]++qsort rhs
  where
    lhs = filter (<x) xs
    rhs = filter (>=x) xs

prop_idempotent xs = qsort (qsort xs) == qsort xs
prop_minimum xs = head (qsort xs)==minimum xs
prop_minimum' xs = not (null xs) ==> head (qsort xs)==minimum xs
