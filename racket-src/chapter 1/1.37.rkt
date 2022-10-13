#lang racket

(provide cont-frac)

(define (cont-frac-rec n d k)
  (define (rec i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))

(define (cont-frac n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1) (/ (n i) 
                         (+ (d i) acc)))))
  (iter k 0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           106)
