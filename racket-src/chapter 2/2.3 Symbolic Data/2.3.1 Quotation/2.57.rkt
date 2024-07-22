#lang racket


(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum . operands)
  (let
      ((num-chars-operands (foldl
                            (lambda (a acc)
                              (if (number? a)
                                  (list
                                   (+ (car acc) a)
                                   (cadr acc))
                                  (list
                                   (car acc)
                                   (append (cadr acc) (list a)))))
                            (list 0 '())
                            operands)))
    (let
        ((final-operands
          (if
           (= (car num-chars-operands) 0)
           (cadr num-chars-operands)
           (cons (car num-chars-operands) (cadr num-chars-operands)))))
      (cond ((null? final-operands) 0)
            ((null? (cdr final-operands)) (car final-operands))
            (else (cons '+ final-operands))))))


(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s)
  (apply make-sum (cddr s)))

(define (make-product . operands)
  (let
      ((num-chars-operands (foldl
                            (lambda (a acc)
                              (if (number? a)
                                  (list
                                   (* (car acc) a)
                                   (cadr acc))
                                  (list
                                   (car acc)
                                   (append (cadr acc) (list a)))))
                            (list 1 '())
                            operands)))
    (let
        ((final-operands
          (cond
            ((= (car num-chars-operands) 0) '())
            ((= (car num-chars-operands) 1) (cadr num-chars-operands))
            (cons (car num-chars-operands) (cadr num-chars-operands)))))
      (cond ((null? final-operands) 0)
            ((null? (cdr final-operands)) (car final-operands))
            (else (cons '* final-operands))))))

(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (multiplier p)
  (cadr p))
(define (multiplicand p)
  (apply make-product (cddr p)))


(define (exponentiation? expr)
  (and (pair? expr) (eq? (car expr) '**)))
(define (base expr) (cadr expr))
(define (exponent expr) (caddr expr))
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ; ((and (number? base) (number? exponent)) (multiply-times base exponent)) <--- here
        (else (list '** base exponent))))


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))

        ((exponentiation? exp)
         (make-product (exponent exp)
                       (make-exponentiation (base exp) (- (exponent exp) 1))))
        (else
         (error "unknown expression type: DERIV" exp))))
