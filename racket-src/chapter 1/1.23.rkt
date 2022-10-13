
#lang racket 

(require "../utils.rkt")

(define (next x)
  (if (= x 2) 
      3
      (+ x 2)))

(define (smallest-divisor n)
  (define (iter i)
    (cond ((= (remainder n i) 0) i)
          ((> (square i) n) n)
          (else (iter (next i)))))
  (iter 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time) n)
    (display "")))

(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower) lower (+ lower 1))))

(search-for-primes 1000000000000000 1000000000000037)