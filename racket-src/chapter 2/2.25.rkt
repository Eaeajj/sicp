#lang racket

(let ((l-1 '(1 3 (5 7) 9))
      (l-2 '((7)))
      (l-3 '(1 (2 (3 (4 (5 (6 7))))))))
  (displayln (cadadr (cdr l-1)))
  (displayln (caar l-2))
  (displayln (cadadr (cadadr (cadadr l-3)))))

