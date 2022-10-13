#lang racket

(require "../utils.rkt")

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner 
      (if (filter a) (term a) null-value)
      (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (sum-of-primes term a next b)
  (filtered-accumulate prime? + 0 term a next b))



(define (mul term a next b)
  (define (is-good? x) 
    (and (positive-integer? x) (= (gcd x b ) 1)))
  (filtered-accumulate is-good? * 1 term a next b))

(sum-of-primes identity 0 inc 10)
(mul identity -2 inc 7)


(define (filtered-accumulate-iter filter combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (if (filter a) 
                  (combiner acc (term a)) 
                  acc) 
              (next a))))
  (iter null-value a))

(define (sum-of-primes-iter term a next b) 
  (filtered-accumulate-iter prime? + 0 term a next b))

(sum-of-primes identity 0 inc 10)


(define (mul-iter term a next b)
  (define (is-good? x) 
    (and (positive-integer? x) (= (gcd x b ) 1)))
  (filtered-accumulate-iter is-good? * 1 term a next b))


; (sum-iter identity 0 inc 5)
(mul-iter identity -2 inc 7)
