#lang racket
(require rackunit)

(provide (all-defined-out))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (remove-set-element x set)
  (cond ((null? set) '())
        ((equal? (car set) x) (remove-set-element x (cdr set)))
        (else (cons (car set) (remove-set-element x (cdr set))))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) (remove-set-element (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))


(define (union-set set1 set2)
  (append set1 set2))

(check-equal? (remove-set-element 4 '(4 2 3 4 )) '(2 3))
; (check-equal? (union-set '(1 2 3) '(2 3 4)) '(1 2 3 4))