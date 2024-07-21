#lang racket

(require (only-in "2.49.rkt" frame-coord-map))
(require "2.47.rkt")
(require "2.46.rkt")
(provide (all-defined-out))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)))

(define (rotate90 painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 1.0 1.0)
   (make-vect 0.0 0.0)))

(define (rotate180 painter)
  (transform-painter
   painter
   (make-vect 1.0 1.0)
   (make-vect 0.0 1.0)
   (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (transform-painter
   painter
   (make-vect 0.0 1.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     ; new end of edge1
                     (make-vect 0.0 0.0))) ; new end of edge2