#lang racket

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpsons-rule f a b n) 
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (term k)
    (* (cond ((= 0 k) 1)
             ((= n k) 1)
             ((even? k) 2)
             (else 4))
    (yk k)))
  (define (inc x) (+ x 1))
  (/ (* h (sum term 0 inc n)) 3))


(define (f x) x)
(simpsons-rule f 0 10 100)