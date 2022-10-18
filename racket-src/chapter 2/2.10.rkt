#lang racket

(require "2.7.rkt")
(provide (all-defined-out))

(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
    (error "Oops! Division by zero")
    (mul-interval
      x
      (make-interval 
        (/ 1.0 (upper-bound y))
        (/ 1.0 (lower-bound y))))))
  
(let 
  ((i-1 (make-interval 2 4))
   (i-2 (make-interval 0 2)))
  (div-interval i-1 i-2))