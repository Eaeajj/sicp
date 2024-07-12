#lang racket
(require "../utils.rkt")

(provide (all-defined-out))

(define empty-board '())

(define (make-pos r c)
  (list r c))

(define (get-row pos)
  (car pos))

(define (get-col pos)
  (cadr pos))

(define (adjoin-position new-row k rest-of-queens)
  (cons (make-pos new-row k) rest-of-queens))

(define (safe? k positions)
  (define (row-same? pos1 pos2)
    (= (get-row pos1) (get-row pos2)))
  (define (diagonal-same? pos1 pos2)
    (=
     (abs (- (get-row pos1) (get-row pos2)))
     (abs (- (get-col pos1) (get-col pos2)))))
  (define (pos-safe? pos1 pos2)
    (or
     (row-same? pos1 pos2)
     (diagonal-same? pos1 pos2)))

  (let ((new-queen-pos (car positions))
        (rest-queens (cdr positions)))
    (null? (filter
            (λ (rest-queen) (pos-safe? new-queen-pos rest-queen))
            rest-queens))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (λ (positions) (safe? k positions))
         (flatmap
          (λ (rest-of-queens)
            (map (λ (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)