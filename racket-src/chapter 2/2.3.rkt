#lang racket

(require "2.2.rkt")

(define (make-rectangle upper-left-corner width height) 
  (cons upper-left-corner 
        (cons width height)))

(define (width rect) (cdr (car rect)))
(define (height rect) (cdr (cdr rect)))

(define test-rect
  (make-rectangle (make-point 10 20) 20 30))

;(define (make-rectangle upper-left-corner lower-right-corner)
;  (cons upper-left-corner lower-right-corner))
;
;(define (width rect)
;  (let ((upper-left-corner (car rect))
;        (lower-right-corner (cdr rect)))
;    (- (x-point lower-right-corner)
;       (x-point upper-left-corner))))
;
;(define (height rect)
;  (let ((upper-left-corner (car rect))
;        (lower-right-corner (cdr rect)))
;    (- (y-point upper-left-corner)
;       (y-point lower-right-corner))))
;
;(define test-rect
;  (make-rectangle (make-point 10 60) (make-point 20 40)))
  
(define (area rect)
  (* (width rect)
     (height rect)))

(define (perimeter rect)
  (* 2 (+ (width rect)
          (height rect))))