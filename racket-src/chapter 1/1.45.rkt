#lang racket

(require "../utils.rkt")
(require "1.35.rkt")
(require "1.43.rkt")

(define (average-damp f)
  (lambda (x) (average x (f x))))

  (define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (damp-number n)
  (floor (/ (log n) (log 2))))

(define (nth-root-of x n)
  (fixed-point-of-transform
    (lambda (y) (/ x (expt y (- n 1))))
    (repeated average-damp (damp-number n))
    1.0))
