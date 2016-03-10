#lang lazy
;#lang racket


(define (my-if condition t f)
  (cond
    (condition t)
    (else f)))

(define (fac n)
  (my-if (< n 1) 1 (* n (fac (- n 1)))))