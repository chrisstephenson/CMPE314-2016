#lang plai-typed

(define (quotient [a : number] [b : number]) : number
  (/ (- a (remainder a b)) b))

(define (number->string [x : number]) : string
                       (if (zero? x) "" (string-append (number->string (quotient x 10))
                                                       (list->string (list (string-ref "0123456789" (modulo x 10)))))))

(define (chop-tail [l : (listof char)]) : (listof char)
  (if (or (empty? l) (char=? (first l) #\- )) empty (cons (first l) (chop-tail (rest l )))))

(define (clear-suffix-number [old : symbol]) : symbol
  (string->symbol (list->string (chop-tail (string->list (symbol->string old))))))

(define (add-new-suffix-number [old-chopped : symbol] [n : number]) : symbol
  (string->symbol (string-append (string-append (symbol->string old-chopped) "-") (number->string n))))

(define (new-ident-fun-maker [start : number]) : [symbol -> symbol]
  (lambda ([old : symbol]) : symbol
    (begin
      (set! start (+ start 1))
      (add-new-suffix-number (clear-suffix-number old) start))))

(define make-new-ident (new-ident-fun-maker 0))


;; use examples
(make-new-ident 'a)
(make-new-ident 'a-123)
(make-new-ident 'hıdır)
(make-new-ident 'hıdır-7)
