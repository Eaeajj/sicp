#lang racket

(require "2.7.rkt" "2.12.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
    one (add-interval (div-interval one r1)
                      (div-interval one r2)))))

(let ((i-1 (make-center-percent 4 15))
      (i-2 (make-interval 4 30)))
  (displayln (par1 i-1 i-2))
  (displayln (par2 i-1 i-2)))