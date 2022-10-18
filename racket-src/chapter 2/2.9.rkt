#lang racket

(require "2.7.rkt" "2.8.rkt" "../utils.rkt")

(define (width i) 
  (half (lower-bound i) (upper-bound i)))


(displayln "\tWidth of result is function on widths")
(let ((i-1 (make-interval 2 4))
      (i-2 (make-interval 3 5)))
  (displayln (list "Prof for add: "
    (=
      (+ (width i-1) (width i-2))
      (width (add-interval i-1 i-2)))))
  (displayln (list "Prof for sub: " 
    (=
      (- (width i-1) (width i-2))
      (width (sub-interval i-1 i-2))))))

(displayln "\tWidth of result is NOT function on widths")
(let ((i-1 (make-interval 2 4))
      (i-2 (make-interval 3 5)))
  (displayln (list "Prof for mul: "
    (=
      (* (width i-1) (width i-2))
      (width (mul-interval i-1 i-2)))))
  (displayln (list "Prof for div: " 
    (=
      (- (width i-1) (width i-2))
      (width (div-interval i-1 i-2))))))
