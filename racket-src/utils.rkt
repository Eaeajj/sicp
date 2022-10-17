#lang racket

(provide (all-defined-out))

(define (square x) (* x x))
(define (cube x) (* x x x))
(define (double x) (* 2 x))

(define (divides? a b) (= 0 (remainder a b)))
(define (to-pos x) (if (< x 0) (* -1 x) x))
(define (average x y)
  (/ (+ x y) 2))

(define (aprox-equal-at arg1 arg2 accuracy)
  (<= (abs (- arg1 arg2)) accuracy))


(define (smallest-divisor n)
  (define (iter i)
    (cond ((divides? n i) i)
          ((> (square i) n) n)
          (else (iter (+ i 1)))))
  (iter 2))

(define (prime? n)
  (if (= n 1) 
    #f 
    (= (smallest-divisor n) n)))

(define (identity x) x)
(define (inc x) (+ x 1))
