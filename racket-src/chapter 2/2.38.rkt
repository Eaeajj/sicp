#lang racket

(provide fold-left fold-right)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (run) (
  (fold-right / 1 (list 1 2 3 5))
  ; (/ 1 (/ 2 (/ 3 (/ 5 1)))) == 3/10
  (fold-left / 1 (list 1 2 3 5))
  ; 1/30
  (fold-right list '() (list 1 2 3))
  (fold-left list '() (list 1 2 3))
  (fold-right + 0 (list 1 2 3 4))
  (fold-left + 0 (list 1 2 3 4))

  ; fold-right and fold-left produce the same value for associative operators

  ; https://stackoverflow.com/questions/8778492/why-is-foldl-defined-in-a-strange-way-in-racket/8780880#8780880
  (foldr / 1 (list 1 2 3 5))
  (foldl / 1 (list 1 2 3 5))
  ; (/ 5 (/ 3 (/ 2 (/ 1 1))))
  ; (/ 1 (/ 5 (/ 3 (/ 2 1))))
  ; (foldr / 1 (list 7 2 3))
  ; (foldl / 1 (list 7 2 3))
))
