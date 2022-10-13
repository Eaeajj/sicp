#lang racket 

(require "../utils.rkt")

(define (smallest-divisor n)
  (define (iter i)
    (cond ((= (remainder n i) 0) i)
          ((> (square i) n) n)
          (else (iter (+ i 1)))))
  (iter 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (time-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time) n)
    (display "")))

(time-prime-test 1000000000000037)