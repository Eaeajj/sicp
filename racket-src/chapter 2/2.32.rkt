#lang racket 

(define (subsets s)
  (if (null? s)
    (list null)
    (let ((rest (subsets (cdr s))))
      (append rest 
              (map (lambda (x) (cons (car s) x)) rest)))))

(subsets '(1 2))


; The set of all subsets of a given set is the union of:

;     the set of all subsets excluding the first number.
;     the set of all subsets excluding the first number, with the first number re-inserted into each subset. 

; Substitution

; (subsets '(1 2 3))
; rest ← (subsets '(2 3))
;        rest ← (subsets '(3))
;               rest ← (subsets '())
;                      '(())
;               (append '(()) (map ⟨…⟩ '(())))
;               '(() (3))
;        (append '(() (3)) (map ⟨…⟩ '(() (3))))
;        '(() (3) (2) (2 3))
; (append '(() (3) (2) (2 3)) (map ⟨…⟩ '(() (3) (2) (2 3))))
; '(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))