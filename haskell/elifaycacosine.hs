fact :: Num a => Integer -> a
fact x = fromIntegral (product [1..x])

cosSeries :: Double -> Integer -> Double
cosSeries x l = sum[(helperOfCos x i) | i <- [0,2..l]]

helperOfCos x i = if i `mod` 4 == 0 then x ^ i / (fact i) else -(x ^ i) / (fact i)


