#lang racket

(require "../utils.rkt")
(require threading)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (is-carmichael-number? n) 
  (define (fermat-test-all n)
    (~> (range 1 n)
        (andmap (lambda (a) (fermat-test n a)) _)))
  (and (fermat-test-all n) (not (prime? n))))

(map is-carmichael-number? '(561 1105 1729 2465 2821 6601))