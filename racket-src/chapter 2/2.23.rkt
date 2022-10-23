#lang racket

(define (for-each f lst) 
    (cond ((null? lst) #t)
      (else
        (f (car lst))
        (for-each f (cdr lst)))))

