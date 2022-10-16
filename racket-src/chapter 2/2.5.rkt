#lang racket

(require "../utils.rkt")

(define (cons a b) 
  (* (expt 2 a)
     (expt 3 b)))

(define (extract-expt num p) 
  (define (iter curr acc)
    (if (divides? curr num) 
      (iter (/ curr num) (+ num 1))
      acc))
  (iter num 0))

(define (car p) (extract-expt 2 p))
(define (cdr p) (extract-expt 3 p))

(car (cons 2 3))



