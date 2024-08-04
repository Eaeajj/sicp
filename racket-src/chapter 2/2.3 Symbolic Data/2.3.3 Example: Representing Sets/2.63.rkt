#lang racket

(provide entry make-tree right-branch left-branch tree->list-2)

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define first-tree (make-tree 7
                              (make-tree 3 (make-tree 1 '() '()) (make-tree 5 '() '()))
                              (make-tree 9 '() (make-tree 11 '() '()))))

(define second-tree (make-tree 3
                               (make-tree 1 '() '())
                               (make-tree 7
                                          (make-tree 5 '() '())
                                          (make-tree 9 '() (make-tree 11 '() '())))))


(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))


(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(tree->list-1 first-tree)
(tree->list-2 first-tree)

(tree->list-1 second-tree)
(tree->list-2 second-tree)

; tree-list-1 O(N*log(N))
;  (append
;  (append (append '() (cons 1 '())) (cons 3 (append '() (cons 5 '()))))
;  (cons 7 (append '() (cons 9 (append '() (cons 11 '()))))))

; tree-list-2 O(N)
; (cons 1 (cons 3 (cons 5 (cons 7 (cons 9 (cons 11 '()))))))