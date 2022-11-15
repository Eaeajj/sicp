#lang racket

(require "./2.33.rkt")

(define (horner-eval x coefficient-sequence)
  (accumulate 
    (lambda (this-coeff higher-terms) 
              (+ this-coeff (* higher-terms x)))
    0
    coefficient-sequence))

(horner-eval 2 '(1 2))