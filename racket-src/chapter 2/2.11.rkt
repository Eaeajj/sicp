#lang racket

(require "2.7.rkt")

(define (sign-pair lb ub)
  (cond ((and (< lb 0) (< ub 0)) -1)
         ((and (< lb 0) (> ub 0)) 0)
         (else 1)))

(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))
    (let ((xs (sign-pair xl xu))
          (ys (sign-pair yl yu)))
    (cond ((< xs 0)
           (cond ((< ys 0)                       ; - - - -
                  (make-interval (* xu yu)
                                 (* xl yl)))
                 ((= ys 0)                       ; - - - +
                  (make-interval (* xl yu)
                                 (* xl yl)))
                 (else                           ; - - + +
                  (make-interval (* xl yu)
                                 (* xu yl)))))
          ((= xs 0)
           (cond ((< ys 0)                       ; - + - -
                  (make-interval (* xu yl)
                                 (* xl yl)))
                 ((= ys 0)                       ; - + - +
                  (make-interval (min (* xl yu)
                                      (* xu yl))
                                 (max (* xl yl)
                                      (* xu yu))))
                 (else                           ; - + + +
                  (make-interval (* xl yu)
                                 (* xu yu)))))
          (else
           (cond ((< ys 0)                       ; + + - -
                  (make-interval (* xu yl)
                                 (* xl yu)))
                 ((= ys 0)                       ; + + - +
                  (make-interval (* xu yl)
                                 (* xu yu)))
                 (else                           ; + + + +
                  (make-interval (* xl yl)
                                 (* xu yu)))))))))
