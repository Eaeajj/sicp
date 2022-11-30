#lang racket

(require "../utils.rkt")

(define (ordered-triples n) 
  (flatmap (λ (i)
              (flatmap (λ (j) 
                          (map (λ (k) (list k j i))
                               (build-list (- j 1) inc)))
                       (build-list (- i 1) inc)))
           (build-list n inc)))

(define (sum-triple triple)
  (accumulate + 0 triple))

(define (ordered-triples-of-sum n s)
  (filter (λ (x) (= (sum-triple x) s))
          (ordered-triples n)))

; (ordered-triples-of-sum 5 10)

(require algorithms)
(require threading)

(define (triplets-sum n k)
  (let ((lst (range 1 (+ n 1))))
    (~>> lst
         (cartesian-product lst lst)
         (filter increasing?)
         (filter (λ (t) (= (sum t) k)))
         )))
