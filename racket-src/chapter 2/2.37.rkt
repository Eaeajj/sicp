#lang racket 

(require "./2.33.rkt" "./2.36.rkt")

(define matr '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define v '(2 2 2 2))
(define w '(2 2 2 2))
(define m-1 '((1 2) (2 1)))
(define m-2 '((3 3) (3 3)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
  (map (lambda (x) 
         (map (lambda (y) (dot-product x y))
              cols))
       m)))

(define (run)
  (displayln (dot-product v w))
  (displayln (matrix-*-vector matr v))
  (displayln (transpose matr))
  (displayln (matrix-*-matrix m-1 m-2)))
