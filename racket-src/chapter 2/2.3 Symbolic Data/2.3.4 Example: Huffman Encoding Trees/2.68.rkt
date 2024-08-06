#lang racket

(require "book.rkt")

(define (encode-symbol symbol tree)
  ())

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))