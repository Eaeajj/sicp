#lang racket

(require "../../2_3_Symbolic_Data/2_3_2_Example_Symbolic_Differentiation/2.56.rkt")

; abstract get & put
(define (get procedure-key datum) (procedure-key))
(define (put procedure-key datum) (procedure-key))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
; a)
; we implemented deriv procedure both for sum and multiply operations
; and stored them with key pairs
; sum:      'deriv '+
; multiply: 'deriv '*

; because there is no generic logic. We should decide what to do with expr
; on top and then choose execute our specific procedure

; b)
(define (install-sum-package)
  (define (deriv-sum s var)
    (make-sum (deriv (addend s) var)
              (deriv (augend s) var)))
  (put 'deriv  '+ deriv-sum)
  'done)


(define (install-product-package)
  (define (deriv-product p)
    (make-sum
     (make-product (deriv (multiplier p))
                   (multiplicand p))
     (make-product (multiplier p)
                   (deriv (multiplicand p)))))

  (put 'deriv '* deriv-product)
  'done)

; c)
(define (install-exp-package)
  (define (deriv-exp p)
    (make-product (exponent exp)
                  (make-exponentiation (base exp) (- (exponent exp) 1))))

  (put 'deriv '** deriv-exp)
  'done)

; d)
; there are 2 ways to handle such change
; 1) change put args order in the same way
; 2) make get wrapper procedure that just reverses args order and applies them
;    to canonical get