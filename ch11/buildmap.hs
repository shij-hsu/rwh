-- file: ch13/buildmap.hs

import qualified Data.Map as Map


a1 = [(1,"one"),(2,"two"),(3,"three"),(4,"four")]

mapFromAL = Map.fromList a1

mapFold = foldl (\m (k,v) -> Map.insert k v m) Map.empty a1

mapManual =
  Map.insert 2 "two" .
  Map.insert 4 "four" .
  Map.insert 1 "one" .
  Map.insert 3 "three" $  Map.empty
