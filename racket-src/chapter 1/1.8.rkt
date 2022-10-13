#lang racket
(require "../utils.rkt")
(require "1.7.rkt")

(define (improve value guess)
  (/ (+ (/ value (square guess)) (* 2 guess))
     3))

(define (cube-root-iter value guess prev)
  (if (good-enough? guess prev)
  guess
  (cube-root-iter value (improve value guess) guess)))


(define (cube-root x)
  (cube-root-iter x 1.0 0))

(cube-root 27)