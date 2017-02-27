-- exercise

len :: [a]->Int
len [] = 0
len (x:xs) = 1+len xs

ave = \x->(sum x)/(fromIntegral $ len x)


rec [] = []
rec (x:xs) = x:(rec xs)++[x]

isRec :: Eq a=>[a]->Bool
isRec = \x->(reverse x)==x

mycompare :: [a]->[a]->Ordering
mycompare = \a b->compare (len a) (len b)

mysort = sortBy . mycompare
