#lang racket

(require "2.12.rkt")

(define (mul-interval x y)
  (make-center-percent (* (center x) (center y))
                       (+ (percent x) (percent y))))
