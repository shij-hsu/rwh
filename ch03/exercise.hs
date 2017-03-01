-- exercise
import Data.List

len :: [a]->Int
len [] = 0
len (x:xs) = 1+len xs

ave = \x->(sum x)/(fromIntegral $ len x)


rec [] = []
rec (x:xs) = x:(rec xs)++[x]

isRec :: Eq a=>[a]->Bool
isRec = \x->(reverse x)==x

mycompare ::[a]->[a]->Ordering
mycompare = \x y->compare (len x) (len y)

mysort :: [[a]]->[[a]]
mysort = sortBy mycompare


myintersperse :: a->[[a]]->[a]
myintersperse _ [] = []
myintersperse _ [l] = l
myintersperse t (x:xs) = x++[t]++(myintersperse t xs)

data Tree a= Node a (Tree a) (Tree a) | Empty

high :: Tree a -> Int
high Empty = 0
high (Node _ l r) = 1+ (max (high l) (high r))


data Dire = DL | DR | DS deriving (Show)
calcTurn :: (Num a, Ord a, Fractional a)=>(a,a)->(a,a)->(a,a)->Dire
calcTurn (x1,y1) (x2,y2) (x3,y3)
      | delt<0    = DL
      | delt>0    = DR
      | otherwise = DS
    where
      (a,b)=(x2-x1,y2-y1)
      (c,d)=(x3-x2,y3-y2)
      delt = (a*d-b*c)/(b*d+a*c)


{-
11.定义一个函数，输入二维坐标点的序列并计算其每个连续三个的（方向）Direction．考虑一个点的序列 [a,b,c,d,e]，他应该开始计算 [a,b,c]的转向(turn), 接着计算 [b,c,d]的转向，再是[c,d,e]的．你的函数应该返回一个Direction（方向）的序列．

12.运用前面三个练习的代码，实现 Graham 扫描算法，用于扫描由二维点集构成的凸包．你能从 `Wikipedia<http://en.wikipedia.org/wiki/Convex_hull>`_ 上找到＂什么是凸包＂，以及 `＂Graham扫描算法＂<http://en.wikipedia.org/wiki/Graham_scan>`_ 的完整解释．
-}
