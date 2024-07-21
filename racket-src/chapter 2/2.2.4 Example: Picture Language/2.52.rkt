#lang racket

(require "2.44.rkt")
(require "2.45.rkt")
(require "2.46.rkt")
(require "2.48.rkt")
(require "2.49.rkt")
(require "2.50.rkt")
(require "2.51.rkt")

(define wave-smile
  (segments->painter
   (list (make-segment (make-vect 0.4 1.0) (make-vect 0.3 0.9))
         (make-segment (make-vect 0.3 0.9) (make-vect 0.4 0.8))
         (make-segment (make-vect 0.6 1.0) (make-vect 0.7 0.9))
         (make-segment (make-vect 0.7 0.9) (make-vect 0.6 0.8))
         (make-segment (make-vect 0.4 0.8) (make-vect 0.2 0.7))
         (make-segment (make-vect 0.2 0.7) (make-vect 0.1 0.5))
         (make-segment (make-vect 0.1 0.5) (make-vect 0.0 0.6))
         (make-segment (make-vect 0.0 0.5) (make-vect 0.1 0.4))
         (make-segment (make-vect 0.1 0.4) (make-vect 0.3 0.6))
         (make-segment (make-vect 0.3 0.6) (make-vect 0.3 0.3))
         (make-segment (make-vect 0.3 0.3) (make-vect 0.2 0.0))
         (make-segment (make-vect 0.4 0.0) (make-vect 0.5 0.3))
         (make-segment (make-vect 0.5 0.3) (make-vect 0.6 0.0))
         (make-segment (make-vect 0.8 0.0) (make-vect 0.7 0.3))
         (make-segment (make-vect 0.7 0.3) (make-vect 0.7 0.6))
         (make-segment (make-vect 0.7 0.6) (make-vect 1.0 0.5))
         (make-segment (make-vect 1.0 0.6) (make-vect 0.8 0.7))
         (make-segment (make-vect 0.8 0.7) (make-vect 0.6 0.8))
         (make-segment (make-vect 0.45 0.85) (make-vect 0.5 0.82))
         (make-segment (make-vect 0.5 0.82) (make-vect 0.55 0.85)))))
; 2.
(define (corner-split-simple painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split-simple painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

; 3.
(define (corner-split-outer painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split (rotate270 painter) (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split-outer painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit-outer painter n)
  (let ((combine4 (square-of-four flip-horiz
                                  identity
                                  rotate180
                                  flip-vert)))
    (combine4 (corner-split-outer painter n))))