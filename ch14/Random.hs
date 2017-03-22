-- file: ch14/Random.hs

import System.Random

rand::IO Int
rand = getStdRandom (randomR (0,maxBound))
