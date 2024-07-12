#lang racket
(require "../utils.rkt")
(require "2.42.rkt")

(define (queens-slow board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (λ (positions) (safe? k positions))
         (flatmap
          (λ (new-row)
            (map (λ (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))
