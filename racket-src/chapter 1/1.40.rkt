#lang racket 

(require "1.35.rkt")
(require "../utils.rkt")


(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))


(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ 
                (cube x)
                (* a (square x))
                (* b x)
                c)))

(newtons-method (cubic 2 3 4) -1)

