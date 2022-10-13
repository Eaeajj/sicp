#lang racket

(define (pt row col)
  (cond ((or (< col 1) (> col row)) 0)
        ((or (= col 1) (= col row)) 1)
        (else (+ (pt (- row 1) (- col 1))
                 (pt (- row 1) col)))))

(pt -2 2)