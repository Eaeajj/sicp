#lang racket

(define (double a) (+ a a))
(define (halve a) (/ a 2))


(define (fast-mul a b)
  (define (fast-mul-iter acc curr-a curr-b)
    (cond ((= curr-b 0) acc)
          ((even? curr-b) (fast-mul-iter acc (double curr-a) (halve curr-b)))
          (else (fast-mul-iter (+ acc curr-a) curr-a (- curr-b 1)))))
  
  (fast-mul-iter 0 a b))

(fast-mul 2 4 )