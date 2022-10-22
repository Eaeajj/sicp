#lang racket

(define (reverse lst) 
  (define (reverse-iter acc lst) 
    (cond ((null? lst) acc)
          (else (reverse-iter 
                  (cons (car lst) acc) 
                  (cdr lst)))))
  (reverse-iter '() lst))

(reverse (list 12 2 3))