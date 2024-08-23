#lang racket
; props to https://github.com/kana/sicp/blob/912bda4276995492ffc2ec971618316701e196f6/ex-2.74.scm
; But i do not agree with specifying tags depending on data-structure
; eg 'ordered-list or 'unordered-list
; Tags should be division specific

; abstract shared procs
(define (get op-name type-tag) (op-name))
(define (put op-name type-tag) (op-name))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))

; abstract division specific selector
; (define (get-employee-name rec) (car rec))

;;; a.  Implement for headquarters a get-record procedure that retrieves
;;; a specified employee's record from a specified personnel file. The
;;; procedure should be applicable to any division's file.  Explain how the
;;; individual divisions' files should be structured. In particular, what type
;;; information must be supplied?

(define (get-record employee-name tagged-personnel-file)
  ((get 'get-record (type-tag tagged-personnel-file))
   employee-name
   (contents tagged-personnel-file)))

(put
 'get-record
 'div-A
 (lambda (employee-name personnel-file)
   (findf
    (lambda (record) (equal? employee-name (get-employee-name record)))
    personnel-file)))

(define (get-record-value key tagged-record)
  ((get 'get-record-value (type-tag tagged-record))
   key
   (contents tagged-record)))

(put
 'get-record-value
 'div-A
 (lambda (key pairs)
   (findf
    (lambda (record) (equal? key (car record)))
    pairs)))

(define (get-employee-name record)
  (get-record-value 'employee-name record))

;;; b.  Implement for headquarters a get-salary procedure that returns the
;;; salary information from a given employee's record from any division's
;;; personnel file. How should the record be structured in order to make this
;;; operation work?

; Each record is a key-value pairs, and the key for salary information is the
; symbol "salary".

(define (get-salary record)
  (get-record-value 'salary record))

;;; c.  Implement for headquarters a find-employee-record procedure. This
;;; should search all the divisions' files for the record of a given employee
;;; and return the record. Assume that this procedure takes as arguments an
;;; employee's name and a list of all the divisions' files.

(define (find-employee-record employee-name files)
  (define (try files)
    (if (null? files)
        #f
        (let ([record (get-record employee-name (car files))])
          (or record (try (cdr files))))))
  (try files))

;;; d.  When Insatiable takes over a new company, what changes must be made in
;;; order to incorporate the new personnel information into the central system?

; If the new company uses its own data representation for the personnel
; information, we have to extend get-record and get-value to support the new
; representation, like:
; (put 'get-record 'div-X (lambda (...) ...))
; (put 'get-value 'div-Y (lambda (...) ...))

; again it does not matter actually what data structure used behind the scene in
; specific company. It can be B-tree, ordered/unordered lists - whatever