#lang racket
(require "2.46.rkt")
(provide (all-defined-out))


(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))