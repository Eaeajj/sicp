#lang racket

(define x '((1 2) (3 4 (5 6)) ))

(define (deep-reverse lst)
  (define (reverse-iter acc items) 
    (cond ((null? items) acc)
          ((pair? items) (reverse-iter 
                            (cons (deep-reverse (car items)) acc) 
                            (cdr items)))
          (else items)))
          
  (reverse-iter '() lst))

(deep-reverse x)