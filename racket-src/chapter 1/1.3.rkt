#lang racket
(require threading)
(require "../utils.rkt")

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-2-large-squares a b c) 
  (cond ((and (> a b) (> b c))(sum-of-squares a b))
        ((and (> c b) (> b a))(sum-of-squares b c))
        (else (sum-of-squares a c))))
          

; concise way

(define (sum-of-largest-squares lst)
  (~> lst
    (sort >)
    (take 2)
    (map (lambda (x) (* x x)) _)
    (foldl + 0 _)))

(sum-of-largest-squares (list 1 2 7))