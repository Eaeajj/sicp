#lang racket

(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (fast-mul a b) 
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))

(fast-mul 2 5)