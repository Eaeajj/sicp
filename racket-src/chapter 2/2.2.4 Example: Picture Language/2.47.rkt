#lang racket
(provide (all-defined-out))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f) (list-ref f 0))
(define (edge1-frame f) (list-ref f 1))
(define (edge2-frame f) (list-ref f 2))

; (define (origin-frame f) (car f))
; (define (edge1-frame f) (cadr f))
; (define (edge2-frame f) (caddr f))

; (define (make-frame-cons origin edge1 edge2)
; (cons origin (cons edge1 edge2)))
; (define (origin-frame f) (car f))
; (define (edge1-frame f) (cadr f))
; (define (edge2-frame f) (cddr f))