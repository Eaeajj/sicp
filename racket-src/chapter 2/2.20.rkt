#lang racket 

(define (same-parity a . rest)
  (define same-parity-as-first? (if (even? a) even? odd?))
  (define (iter acc lst) 
    (if (null? lst) 
      acc
      (iter 
        (if (same-parity-as-first? (car lst))
              (append acc (list (car lst)))
              acc)
        (cdr lst))))
  (iter '() rest))

(same-parity 2 1 2 3 4 5 6 7)