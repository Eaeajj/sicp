#lang racket 

(require "./2.33.rkt")
(provide accumulate-n)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (run) 
  (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))

(run)