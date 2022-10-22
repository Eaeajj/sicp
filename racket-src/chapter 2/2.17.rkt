#lang racket

(define (last-pair lst)
    (cond 
      ((null? lst) (error "Empty list"))
      ((null? (cdr lst)) lst)
      (else (last-pair (cdr lst)))))


(last-pair (list 12 2 3 4))
(last-pair (list 1))