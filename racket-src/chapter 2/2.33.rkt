#lang racket
(require "../utils.rkt")

(provide accumulate)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence) 
  (accumulate + 0 sequence))

(define (run) 
  (displayln (map square '(1 2)))
  (displayln (append '(0 0) '(1 2)))
  (displayln (length '(1 2)))
)