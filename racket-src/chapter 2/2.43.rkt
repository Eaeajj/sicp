#lang racket
(require "../utils.rkt")
(require "2.42.rkt")

(define (queen-cols-slow k board-size)
  (if (= k 0)
      (list empty-board)
      (filter
       (λ (positions) (safe? k positions))
       (flatmap
        (λ (new-row)
          (map
           (λ (rest-of-queens) (adjoin-position new-row k rest-of-queens))
           (queen-cols-slow (- k 1) board-size)))
        (enumerate-interval 1 board-size)))))

(define (queens-slow board-size)

  (queen-cols-slow board-size board-size))


; queen-cols-slow is called 'board-size' times
; when we going through flatmap
; It(queen-cols-slow) generates all possible positions then filter them