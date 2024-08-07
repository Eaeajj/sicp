#lang racket

(require "book.rkt")
(require "2.67.rkt")
(require rackunit)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
      (car leaf-set)
      (successive-merge
       (adjoin-set
        (make-code-tree (car leaf-set) (cadr leaf-set))
        (cddr leaf-set)))))

(define sample-tree-2 (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))

(check-equal?
 (decode sample-message sample-tree-2)
 (decode sample-message sample-tree))