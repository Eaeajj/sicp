#lang racket

(define (=zero? x) (apply-generic '=zero? x))

;; add into scheme-number-package
(put '=zero? '(scheme-number) (lambda (x) (= x 0)))

;; add into rational-package
(put '=zero? '(rational)
     (lambda (x) (= (numer x) 0)))

;; add into complex-package
(put '=zero? '(complex)
     (lambda (x) (= (real-part x) (imag-part x) 0)))