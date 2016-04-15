#lang racket

;; true laziness!!
(define-syntax-rule (delay expr)
  (let
      ((done false) (value empty))
    (λ () (if done value
              (begin
                (set! value expr)
                (set! done true)
                value)))))

(define (force promise)
  (promise))

(define (+& a b)
  (begin
    (newline) (display a) (display " + ") (display b) (display " -> ") (display (+ a b)) (newline)
    (+ a b)))

(define-syntax-rule (lazy-cons a b)
  (cons (delay a) (delay b)))

(define (lazy-first a) (force (car a)))
(define (lazy-rest a) (force (cdr a)))

(define ones (lazy-cons 1 ones))

(define (head n lzl)
  (if (<= n 0) empty (cons (lazy-first lzl) (head (- n 1) (lazy-rest lzl)))))

(define (lazy-map f lzl)
  (lazy-cons (f (lazy-first lzl)) (lazy-map f (lazy-rest lzl))))

(define integers (lazy-cons 1 (lazy-map (curry +& 1) integers)))

(define (lazy-map2 f2 lzl1 lzl2)
  (lazy-cons (f2 (lazy-first lzl1) (lazy-first lzl2))
             (lazy-map2 f2 (lazy-rest lzl1) (lazy-rest lzl2))))

(define hoho (lazy-cons 1 (lazy-cons 1 (lazy-map2 +& hoho (lazy-rest hoho))))) 

  
  