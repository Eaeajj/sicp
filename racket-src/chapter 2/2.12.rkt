#lang racket

(require "2.7.rkt")
(provide (all-defined-out))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent) (make-center-width center (* 0.01 percent center )))
(define (percent i) (/ (width i) (center i) 0.01))

(define (run) 
  (let ((i (make-center-percent 1 15)))
  (displayln "make-center-width")
  (percent i)))

; testing ----------------------------------
; (define (display-interval i) 
;   (displayln (lower-bound i))
;   (displayln (upper-bound i)))

; (let ((i (make-interval 0.85 1.15)))
;   (displayln "make-interval")
;   (display-interval i))

; (let ((i (make-center-width 1 0.15)))
;   (displayln "make-center-width")
;   (display-interval i))

; (let ((i (make-center-percent 1 15)))
;   (displayln "make-center-width")
;   (display-interval i))
  
