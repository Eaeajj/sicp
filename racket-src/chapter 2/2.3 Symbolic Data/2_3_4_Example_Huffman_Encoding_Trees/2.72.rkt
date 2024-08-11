#lang racket

(require "book.rkt")


(define (encode-symbol-with-output s tree)
  (define (encode-symbol-helper s tree)
    (printf "(encode-symbol-helper ~a ~a)\n" s tree)
    (cond ((empty? tree) #f)
          ((leaf? tree) (if (eq? (symbol-leaf tree) s)
                            empty
                            (begin
                              (printf "Reached a leaf but it was not ~a\n" s)
                              #f)))
          ((begin
             (printf "Evaluating (memq ~a ~a)\n" s (symbols tree))
             (not (memq s (symbols tree))))
           (printf "Stopping recursion at (encode-symbol-helper ~a ~a) because the symbol is not in this branch\n" s tree)
           #f)
          (else
           (define result-left (encode-symbol-helper s (left-branch tree)))
           (define result-right (encode-symbol-helper s (right-branch tree)))
           (cond (result-left (cons 0 result-left))
                 (result-right (cons 1 result-right))
                 (else #f)))))
  (define result (encode-symbol-helper s tree))
  (if (not result) (error "symbol not in tree -- ENCODE-SYMBOL" s) result))

;; Above is the encode-symbol function defined for exercise 2.68, with some
;; output added to help trace the recursive calls.
;;
;; In the case of the most frequent symbol, first (memq s tree) will be evaluated
;; at the root, which will take O(n) steps. There will be exactly two recursive
;; calls made, one to each branch of the tree. The left recursion will stop after
;; one step because (not (memq s tree)) will produce true, since the symbol is in
;; the right branch of the root, and therefore not in the list of symbols for the
;; left branch. The right recursion will also stop after one step, without calling
;; memq, since it will be at the leaf that contains the most frequent symbol. Thus,
;; encoding the most frequent symbol takes O(n) + O(n) + O(1) = O(n) steps.
;;
;; Encoding the least frequent symbol will make n-1 left-recursive calls, each of
;; which will make a call to memq that takes in general O(n) steps to evaluate.
;; Each call will also generate a right-recursion, which will again stop after
;; one step because it will be at a leaf that is not the intended symbol. Thus, we
;; have n-1 left recursions that each take O(n) steps, and n-1 right recursions that
;; each take O(1) steps, to get a total of (n-1) * O(n) + (n-1) * O(1) = O(n^2).
;;
;; Note: The above holds if we make no assumptions about how order is preserved in the
;; symbol list for each node. If the list is ordered from lowest to highest weight (as
;; in fact the given implementation will construct), the calls to memq will actually only
;; take O(1) time, since it will find the symbol after looking at only one element in the
;; list. Thus, __depending on how the symbol list is constructed__, encoding the least
;; frequent symbol could be as good as n * O(1) + (n-1) * O(1) = O(n).