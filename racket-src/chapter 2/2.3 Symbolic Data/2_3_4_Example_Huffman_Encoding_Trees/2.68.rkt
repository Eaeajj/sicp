#lang racket

(require "book.rkt")
(require "2.67.rkt")
(require (only-in "../2_3_3_Example_Representing_Sets/2.60.rkt" element-of-set?))

(define (encode-symbol symbol tree)
  (if (element-of-set? symbol (symbols tree))
      (if (leaf? tree)
          '()
          (if (element-of-set? symbol (symbols (left-branch tree)))
              (cons 0 (encode-symbol symbol (left-branch tree)))
              (cons 1 (encode-symbol symbol (right-branch tree)))))
      (error "No such symbol in tree" symbol)))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(encode-symbol 'A sample-tree)