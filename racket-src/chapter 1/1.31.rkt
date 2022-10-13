#lang racket

(require "../utils.rkt")

(define (product-in-range term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (* acc (term a)))))
  (iter a 1))

; a)

(define (factorial x) 
  (if (= x 0)
    1
    (product-in-range identity 1 inc x)))

(factorial 5)

; b)

(define (appr-pi n)
  (define (term x)
    (if (odd? x)
        (/ (+ 1 x) (+ 2 x))
        (/ (+ 2 x) (+ 1 x))))
  (* 4
     (product-in-range term 1 inc n)))

(appr-pi 100)