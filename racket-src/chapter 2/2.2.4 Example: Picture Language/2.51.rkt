#lang racket

(require "2.46.rkt")
(require "2.50.rkt")
(provide beside below)

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left (transform-painter
                       painter1
                       (make-vect 0.0 0.0)
                       split-point
                       (make-vect 0.0 1.0)))
          (paint-right (transform-painter
                        painter2
                        split-point
                        (make-vect 1.0 0.0)
                        (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-top
           (transform-painter
            painter1
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0)))
          (paint-bottom
           (transform-painter
            painter2
            (make-vect 0.0 0.0)
            (make-vect 1.0 0.0)
            split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))


(define (below-with-beside painter1 painter2)
  (rotate90
   (lambda (frame)
     (beside (rotate270 frame)
             (rotate270 frame)))))