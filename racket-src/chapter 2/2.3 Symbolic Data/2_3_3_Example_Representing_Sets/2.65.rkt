#lang racket
(require "2.64.rkt" "2.62.rkt" "2.63.rkt")

(define (union-set-bal set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (list->tree (union-set (tree->list-2 set1) (tree->list-2 set2))))))


(define (intersection-set-bal set1 set2)
  (cond ((null? set1) null)
        ((null? set2) null)
        (else (list->tree (intersection-set (tree->list-2 set1) (tree->list-2 set2))))))