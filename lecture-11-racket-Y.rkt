#lang racket
(((λ (f) (λ (n) (f f n)))
(λ (fac n) (if (<= n 1) 1 (* n (fac fac ( - n 1))))))
 700)
