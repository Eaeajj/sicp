#lang racket

(require "../utils.rkt")

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve)
         (improve guess)))))

(define (sqrt x)
  (define (good-enough? guess)
    (let ((tolerance 0.001))
      (< (abs (- square guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (let ((good-enough? (lambda (x) (close-enough? x (f x))))
        (improve f))
    ((iterative-improve good-enough? improve) guess)))
