#lang racket

(require rackunit "../utils.rkt")

(define (double g) 
  (lambda (x) (g (g x)))) 


(((double (double double)) inc) 5)


(double (double) 1)

