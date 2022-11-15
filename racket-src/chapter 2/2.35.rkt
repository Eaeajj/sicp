#lang racket

(require "./2.33.rkt")

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (count-leaves-acc t)
  (accumulate + 0 
    (map (lambda (tree) 
                 (if (pair? tree) 
                     (count-leaves-acc tree) 1))
         t)))


(define (run) 
  (equal? (count-leaves (list 1 (list 2 (list 3 4))))
          (count-leaves-acc (list 1 (list 2 (list 3 4))))))

(run)