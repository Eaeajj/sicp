#lang racket

(require "../utils.rkt")
(provide repeated)

(define (repeated g n) 
  (lambda (x) 
    (define (iter acc count) 
      (if (= count n)
        acc
        (iter (g acc) (inc count))))
    (iter x 0)))

((repeated inc 2) 5)
    