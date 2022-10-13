#lang racket

(provide fixed-point)

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
      tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (lambda (y) (/ (+ y (/ x y)) 2))
1.0))

; (sqrt 9)

; (fixed-point cos 1.0)

(define (golden-ration) 
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
  1.0))

(golden-ration)