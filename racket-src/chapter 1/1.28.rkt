#lang racket

(require "../utils.rkt")

(define (expmod base exp m)
  (define (nontrivial-test x n)
    (if (and (not (or (= x 1)
                      (= x (- n 1))))
         (= (remainder (square x) 
                       n) 
            1))
        0
        x))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (nontrivial-test (expmod base (/ exp 2) m) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (define (iter a)
    (cond ((= a 0)
           #t)
          ((try-it (+ 1 (random (- n 1))))
           (iter (- a 1)))
          (else #f)))
  (iter 10)) ;; 10 is the number of test cases

(miller-rabin-test 37)