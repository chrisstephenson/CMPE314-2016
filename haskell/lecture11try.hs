fac :: Integer -> Integer
fac 0 = 1
fac n = n * fac (n - 1)

ones = 1 : ones

quicksort :: (a -> a -> Bool) -> [a] -> [a]
quicksort _ [] = []
quicksort before (x : xs) = quicksort before [y | y <- xs, before y x]
		++ [x]
		++ quicksort before [y | y <- xs, not (before y x)]

evens [] = []
evens (x:xs) = x : odds xs
odds [] = []
odds (x:xs) = evens xs


merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
merge _ x [] = x
merge _ [] x = x
merge before (x:xs) (y:ys)
	| before x y = x : merge before xs (y:ys)
	| otherwise = y : merge before (x:xs) ys

mergesort :: (a -> a -> Bool) -> [a] -> [a]
mergesort _ [] = []
mergesort _ [x] = [x]
mergesort before l  = merge before (mergesort before (evens l)) (mergesort before (odds l))

square x = x * x

isPrime :: [Integer] -> Integer -> Bool
isPrime primesSoFar n 
	| square (head primesSoFar) > n = True
	| mod n (head primesSoFar) == 0 = False
	| otherwise = isPrime (tail primesSoFar) n

primes = 2 : [n | n <- [3,5 ..], isPrime primes n] 


