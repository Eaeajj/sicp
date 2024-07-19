#lang racket

(require "../utils.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (build-list (- i 1) (lambda (x) (+ x 1)))))
           (build-list n (lambda (x) (+ x 1)))))


(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 4)


(define (prime-sum-pairs-example n)
  (map make-pair-sum
       (filter prime-sum? (flatmap
                           (lambda (i)
                             (map (lambda (j) (list i j))
                                  (enumerate-interval 1 (- i 1))))
                           (enumerate-interval 1 n)))))

(require algorithms)
(require threading)

(define (unique-pairs-2 n)
  (let ((lst (range 1 (+ n 1))))
    (~> lst
        (cartesian-product lst)
        (filter increasing?)
        (remove-duplicates))))