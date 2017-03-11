-- file: ch06/Newtype.hs
{-
data 关键字提出（introduce）一个真正的代数（albegraic）数据类型。
type 关键字给我们一个别名（synonym）去用，为一个存在着的（existing）类型。 我们可以交换地（interchangeably）使用这个类型和他的别名,
newtype 关键字给予一个存在着的类型以一个独特的身份（distinct identity）。 这个原类型和这个新类型是不可交换的（interchangeable）。
-}

data DataInt = D Int deriving (Eq, Ord, Show)

newtype Newtype = N Int deriving (Eq, Ord, Show)

newtype UniqueID = UniqueID Int deriving (Eq)
