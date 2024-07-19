#lang racket
(#%require sicp-pict)

(define (split proc1 proc2)
  (define (specific-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (specific-split painter (- n 1))))
          (proc1 painter (proc2 smaller smaller)))))

  specific-split)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (up-split einstein 3))
(paint (right-split einstein 3))