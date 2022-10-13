#lang racket

(require "../utils.rkt")

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner 
      (term a)
      (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (mul term a next b)
  (accumulate * 1 term a next b))

(sum identity 0 inc 5)
(mul identity 1 inc 5)


(define (accumulate-iter combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner acc (term a)) (next a))))
  (iter null-value a))

(define (sum-iter term a next b) 
  (accumulate-iter + 0 term a next b))

(define (mul-iter term a next b) 
  (accumulate-iter * 1 term a next b))


(sum-iter identity 0 inc 5)
(mul-iter identity 1 inc 5)
