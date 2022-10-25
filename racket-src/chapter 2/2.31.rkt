#lang racket

(require "../utils.rkt")

(define (map-tree transform tree)
  (map (lambda (sub-tree)
    (if (pair? sub-tree)
      (map-tree transform sub-tree)
      (transform sub-tree)))
    tree))

(define (square-tree tree) (map-tree square tree))

(square-tree
  (list 1
  (list 2 (list 3 4) 5)
  (list 6 7)))