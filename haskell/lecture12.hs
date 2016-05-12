integrate s = zipWith (/) s [1,2 ..]

funny = 1 : integrate funny

sums s = (head s) : map ((+) (head s)) (sums (tail s)) 

powers x = 1 : map (* x) (powers x)

sineSeries = 0 : integrate cosSeries
cosSeries = 1 : integrate (map negate sineSeries)

sinexSeries x = zipWith (*) (powers x) sineSeries
cosxSeries x = zipWith (*) (powers x) cosSeries

sineSums = sums . sinexSeries
cosSums = sums . cosxSeries


facs = 1 : zipWith (*) facs [2,3 ..]

fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

isPrime lp n 
	| (head lp) ^ 2 > n = True
	| mod n (head lp) == 0 = False
	| otherwise = isPrime (tail lp) n

primes = 2 : (filter (isPrime primes) [3,5 ..])

-- declare an array of Num as a kind of Num with polynomial arithmetic
instance Num a => Num [a] where
	(ph:pt) + (qh:qt) = ph + qh : pt + qt
	p + [] = p
	[] + q = q
	(ph:pt) * (qh:qt) = ph * qh : [ph] * qt + pt * (qh:qt)
	_ * _ = []
   	signum        = map signum
   	fromInteger n  = [fromInteger n]
   	negate        = map negate
 	abs           = map abs   


evalPoly :: Num a => [a] -> a -> a
evalPoly p x = foldr (\l r -> l + x * r) 0 p 

makePolyFromRoots rs = foldr (*) [1] (map (\x -> [-x, 1]) rs)

diffPoly p = zipWith (*) (tail p) [1..]

diffFunc f deltaX = \ x -> (f (x + deltaX) - f(x)) / deltaX


--generate Pascal's triangle using polynomial exponentiation
pascalsTriangle = (map (\n -> [1,1] ^ n) [1,2..])

