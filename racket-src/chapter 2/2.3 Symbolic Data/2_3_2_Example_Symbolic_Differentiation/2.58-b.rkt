#lang racket
(require rackunit)

(define (variable? x) (symbol? x))


(define (operator? op)
  (or (eq? op '+)
      (eq? op '*)))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))


(define (sum? x)
  (and (pair? x) (foldl (lambda (x y) (or (eq? x '+) y)) #f x)))

(define (addend s)
  (define (rec s)
    (if (eq? (car s) '+)
        null
        (cons (car s) (rec (cdr s)))))
  (if (= (length (rec s)) 1) (car (rec s)) (rec s)))

(define (augend s)
  (define (rec s)
    (if (eq? (car s) '+)
        (cdr s)
        (rec (cdr s))))
  (if (= (length (rec s)) 1) (car (rec s)) (rec s)))

(define (product? x)
  (and (pair? x) (foldl (lambda (x y) (and (eq? x '*) y)) #t (filter operator? x))))
(define (multiplier p)
  (define (rec p)
    (if (eq? (car p) '*)
        null
        (cons (car p) (rec (cdr p)))))
  (car (rec p)))
(define (multiplicand p)
  (define (rec p)
    (if (eq? (car p) '*)
        (cdr p)
        (rec (cdr p))))
  (if (= (length (rec p)) 1)
      (car (rec p))
      (rec p)))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

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
        (else
         (error "unknown expression type: DERIV" exp))))


(check-equal? (deriv '(x * x * x) 'x) '((x * (x + x)) + (x * x)))
(check-equal? (deriv '(x * 3 + 3 * x) 'x) 6)
(check-equal? (deriv '(x * 7 + 3 + x) 'x) 8)
(check-equal? (deriv '(x + x + x) 'x) 3)
(check-equal? (deriv '(x + 3 * x) 'x) 4)