#lang racket
(require "2.63.rkt")

; abstract selector
(define (key record) (car record))

(define (lookup given-key b-tree-set-of-records)
  (if (null? b-tree-set-of-records)
      #f
      (let ((record (entry b-tree-set-of-records)))
        (cond ((= given-key (key record)) record)
              ((> given-key (key record)) (lookup given-key (right-branch b-tree-set-of-records)))
              (else (lookup given-key (left-branch b-tree-set-of-records)))))))