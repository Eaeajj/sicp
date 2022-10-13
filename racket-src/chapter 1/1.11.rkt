#lang racket

(define (f n)
  (if (< n 3) n
    (+ 
      (f (- n 1))
      (* 2 (f (- n 2)))
      (* 3 (f (- n 3)))
)))

(f 4)

(define (f-2 n)
  (define (f-iter a b c count)
    (if (> count n) 
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1))))
  (if (< n 3)
    n
    (f-iter 2 1 0 3)))


(f-2 4)