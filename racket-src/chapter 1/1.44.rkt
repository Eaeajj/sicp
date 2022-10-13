#lang racket

(require "1.43.rkt")

(define dx 0.00001)

(define (smooth f) 
  (lambda (x) (/ (+
                  (f (- x dx))
                  (f x)
                  (f (+ x dx))) 
              3)))

(define (smooth-n-times fn n)
  (let ((smoother (repeated smooth n)))
    (smoother fn)))
