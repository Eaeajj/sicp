#lang racket

(require "../utils.rkt")

(define (square-list items)
  (if (null? items)
    null
    (cons 
      (square (car items)) 
      (square-list (cdr items)))))

(define (map-square-list items)
  (map square items))




(define (run) 
  (let ((lst '(1 2 3 4)))
    (displayln (square-list lst))
    (displayln (map-square-list lst))))

(run)