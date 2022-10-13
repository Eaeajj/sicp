#lang racket

(require "../utils.rkt")

(define (sum-in-range term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (+ acc (term a)))))
  (iter a 0))

(sum-in-range identity 0 inc 5)