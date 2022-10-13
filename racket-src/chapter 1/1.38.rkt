#lang racket

(require "1.37.rkt")


(define (n i)
  1)
(define (divides? a b)
  (= 0 (remainder b a)))
(define (d i)
  (if (divides? 3 (+ 1 i))
      (* 2 (/ 3 (+ 1 i)))
    1))

(cont-frac n d 100)