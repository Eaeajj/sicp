#lang racket
; props to
; https://github.com/CompSciCabal/SMRTYPRTY/blob/a8e2c5049199635fecce7b7f70a2225cda6558d8/sicp/v3/2.3/hz-huffman.rkt

;;
;; Consider the steps in the Huffman tree generation algorithm:
;;
;; 1) Find the two smallest weighted nodes and combine them into a new node.
;; 2) Remove these nodes from the list and replace them with the new node.
;; 3) Recurse with the new list.
;;
;; Note: Because all of the weights are successive powers of 2, the lowest weight
;; in the list is either 2^0 = 1, or is a sum of successive powers of 2.
;; Either way, the lowest weight in the list at any time will have the form
;; 2^k - 1 for some k > 0.
;;
;; Suppose the lowest weight in the list is Σi=0,k (2^i) = (2^k)-1. Then, the new
;; node created in the first two steps will have a weight of (2^k)-1 + 2^k, and the
;; lowest weight in the remaining list (i.e. with the lowest two elements removed)
;; will be 2^(k+1). But note that
;;   (2^k)-1 + 2^k = 2*2^k - 1 = 2^(k+1) - 1 < 2^(k+1)
;;
;; Thus, the new node added in step 2 will always be the lowest weighted node in
;; the new list. Thus, the shape of the tree will look something like the following:
;;                               [s_1,...,s_n]
;;                                /         \
;;                     [s_1,...,s_n-1]   (leaf s_n 2^(n-1))
;;                      /            \
;;                 [s_1,...,s_n-2]  (leaf s_n-1 2^(n-2))
;;                 /            \
;;            [s_1,...,s_n-3] (leaf s_n-2 2^(n-3))
;;
;; ...etc.
;;
;; I.e., a very unbalanced tree.
;; Thus, it will take one bit to encode the most frequently used symbol (s_n), and
;; n-1 bits (the height of the tree) to encode the least frequently used symbol (s_1).
;;-----------------------------------------------------------------------------