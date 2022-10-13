#lang racket

(define (make-rat n d)
  (let ((g (gcd n d))
        (multiplier (if (< d 0) -1 1)))
    (cons (/ (* n multiplier) g)
          (/ (* d multiplier) g))))
          
(make-rat -1 -2)
(make-rat -1 2)
(make-rat 1 -2)
(make-rat 1 2)
