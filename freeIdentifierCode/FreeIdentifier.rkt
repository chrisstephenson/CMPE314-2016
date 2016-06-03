#lang racket
(require plai-typed)
(print-only-errors #f)

; λ-expression grammar
; LAMBDA -> v
; LAMBDA -> (LAMBDA LAMBDA)
; LAMBDA -> (λ v LAMBDA)


; λ-exp is an abstract syntax grammar or a parse tree definition for
; λ-exp that defined above.
(define-type λ-exp
(λ-sym (v : symbol))
(λ-app (l : λ-exp)(r : λ-exp))
(λ-def (v : symbol)(p : λ-exp)))

; parse : s-exp -> λ-exp
; Purpose : To transform given s-expression to corresponding
(define (parsel (sexp : s-expression)) : λ-exp
(cond
[(s-exp-symbol? sexp)(λ-sym (s-exp->symbol sexp))]
[(s-exp-list? sexp)
(let ([sexp-list (s-exp->list sexp)])
(cond
[(= 2 (length sexp-list))
(λ-app (parsel (first sexp-list))(parsel (second sexp-list)))]
[(= 3 (length sexp-list))
(if (and (symbol=? 'λ (s-exp->symbol (first sexp-list)))
(s-exp-symbol? (second sexp-list)))
(λ-def (s-exp->symbol(second sexp-list))
(parsel (third sexp-list)))
(error parsel "Not valid λ-definition")
)]
[else (error parsel "Not valid length λ-exp")]
))]
[else (error parsel "Not valid λ-exp")]
))


; A set represented as a list.
; union : (listof symbol) (listof symbol) -> (listof symbol)
; finding the union of two sets.
(define (union (s1 : (listof symbol)) (s2 : (listof symbol))) : (listof symbol)
(foldr (lambda (x y)
(if (member x y)
y
(cons x y))) 
empty
(append s1 s2)))

; set-difference : (listof symbol) (listof symbol) -> (listof symbol)
; To find the set difference of two sets.
(define (set-difference (s1 : (listof symbol)) (s2 : (listof symbol))) : (listof symbol)
(filter (lambda (x)
(not (member x s2)))
s1))

; free-identifier : λ-calc -> (listof symbol)
; Purpose : To find free identifiers in given λ expression.
(define (free-identifier (le : λ-exp)) : (listof symbol)
(type-case λ-exp le
(λ-sym (v) (list v))
(λ-app (l r)(union 
(free-identifier l)
(free-identifier r)))
(λ-def (v p)(set-difference (free-identifier p)
(list v)))
))

(test (free-identifier (parsel '(λ x x))) empty)
(test (free-identifier (parsel '(λ x y))) (list 'y))
(test (free-identifier (parsel '((λ x y)(λ y z)))) (list 'y 'z))
(test (free-identifier (parsel '((λ f y)(λ z z)))) (list 'y))


(free-identifier (parsel '((λ a ((λ SUCC (λ b (SUCC a))) (λ n (λ f (λ x (f ((n f) x))))))) b)))
(free-identifier (parsel '((λ p ((λ ADD (λ p ((ADD p)p))) (λ n (λ m (λ f (λ x ((m f) ((n f) x)))))))) q))) ;; Here is yours Sena