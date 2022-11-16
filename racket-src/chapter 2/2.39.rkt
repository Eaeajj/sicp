#lang racket

(require "./2.38.rkt")

(define (reverse-1 sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))
(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(reverse (list 1 2 3 5))
(reverse-1 (list 1 2 3 5))
(reverse-2 (list 1 2 3 5))