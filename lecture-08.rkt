#lang racket

(let
    ((double (λ (x) (* x 2))))
  (double 7))

((λ (double)
   (double 7))
    (λ (x) (* x 2)))

(define (mul-list-by-n l n)
  (map (λ (x) (* x n)) l))

(mul-list-by-n '(3 4) 3)
(mul-list-by-n '(5 6 7) 7)