#lang racket

(define (make-mobile left right)
  (list left right))
  
(define (make-branch len structure)
  (list len structure))

(define mobile? pair?)
; a)

(define left-branch car )
(define right-branch cadr )

(define branch-length car)
(define branch-structure cadr)

; b)

(define (branch-weight b) 
  (let ((b-struct (branch-structure b)))
    (if (mobile? b-struct)
        (total-weigth b-struct)
        b-struct)))
    
(define (total-weigth m) 
  (+ 
    (branch-weight (left-branch m))
    (branch-weight (right-branch m))))


(define (test-b) 
  (define b-3 (make-branch 2 2))
  (define b-4 (make-branch 2 2))
  (define m-1 (make-mobile b-3 b-4))
  (define b-1 (make-branch 2 m-1))
  (define b-2 (make-branch 2 m-1))

  (define m-root (make-mobile b-1 b-2))

  (total-weigth m-root))

(test-b)

; c 

(define (torque branch) 
  (let ((b-struct (branch-structure branch)))
    (* 
      (branch-length branch)
      (if (mobile? b-struct)
          (total-weigth b-struct)
          b-struct)))
  )

(define (balanced? mobile)
  (define lb (left-branch mobile))
  (define rb (right-branch mobile))
  (define (branch-moment branch)
    (* (branch-length branch) (branch-weight branch)))
  (if (not (mobile? mobile))
    true
    (and
      (= (branch-moment lb) (branch-moment rb))
      (and (balanced? (branch-structure lb))
            (balanced? (branch-structure rb))))))


; d) two letters in total. instead of 'cadr' will be 'car' in accessors