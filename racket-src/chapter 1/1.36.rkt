#lang racket

(define-logger my-log)

(define (fixed-point-log fn first-guess)
  (define (close-enough a b)
    (< (abs (- a b)) 0.0001))
  (define (iter-point privious-resalt)
    (let ((guess (fn privious-resalt)))
      (displayln guess)
      (if (close-enough guess privious-resalt)
        guess
        (iter-point guess))))
  (iter-point first-guess))

(define (expt-x-to-x-equal y)
  (fixed-point-log (lambda (x) (/ (log y) (log x))) 10))

(expt-x-to-x-equal 1000)