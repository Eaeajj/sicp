#lang racket
(require "../utils.rkt")
(provide good-enough?)

(define (good-enough? guess prev-guess)
  (aprox-equal-at guess prev-guess 0.000001))

(define (improve-guess value guess)
  (average guess (/ value guess)))

(define (sqtr-iter value guess prev-guess)
  (if (good-enough? guess prev-guess)
    guess
    (sqtr-iter value (improve-guess value guess) guess)))

(define (my-sqrt value)
  (sqtr-iter value 1.0 0))

; (* 0.009 0.009)