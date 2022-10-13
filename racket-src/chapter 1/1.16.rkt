#lang racket


(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
              (- counter 1)
              (* b product))))

(define (expt b n)
  (expt-iter b n 1))

(define (square x) (* x x) )

(define (fast-expt b n)
  (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))


(define (my-expt num pow)
  (define (iter acc curr-num curr-pow)
    (cond ((= curr-pow 0) acc)
          ((even? curr-pow) (iter acc (square curr-num) (/ curr-pow 2)))
          (else (iter (* acc curr-num) curr-num (- curr-pow 1)))))

    (iter 1 num pow ))

(my-expt 2 5)