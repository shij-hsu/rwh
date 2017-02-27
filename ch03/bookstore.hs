data BookInfo = Book Int String [String] deriving (Show)
data MagzineInfo = MagzineInfo Int String [String] deriving (Show)
myInfo = Book 122893 "Algebra of Programming" ["Richard Bird","Shijie Xu"]
type CustomID = Int
type ReviewBody = String
data BookReview = BookReview BookInfo CustomID ReviewBody deriving (Show)

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]
data BiilingInfo = CreaditCard CardNumber CardHolder Address
  | CashOnDelivery
  | Invoice CustomID deriving (Show)
