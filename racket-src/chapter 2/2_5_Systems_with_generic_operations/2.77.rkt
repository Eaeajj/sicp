#lang racket

; http://community.schemewiki.org/?sicp-ex-2.77

; Our complex number implementation constructors first call the polar or rectangular constructors, and tag the result with the 'complex tag resulting in the representation found in Figure 2.24.
;    ('complex . ('rectangular . (x . y)))
;    ('complex . ('polar . (r . a)))
; When Mr. Reasoner called the magnitude function the type-tags call used in apply-generic returned the outer tag of z (complex). Because Mr. Reasoner had not put a magnitude function under the complex tag anywhere in his code this returns an error.


;  (define (apply-generic op . args)
;    ;; as seen in 2.4.3
;    (let ((type-tags (map type-tag args)))
;      (let ((proc (get op type-tags))) ;; <- here is where Louis gets in trouble
;        (if proc
;          (apply proc (map contents args))
;          (error
;            "no method for these types -- APPLY-GENERIC"
;            (list op type-tags))))))

;  (define (install-polar-package)
;    (define (magnitude z) (car z))
;    ...
;    (put 'magnitude '(polar) magnitude)
;    ...
;    'done)

;  (define install-rectangular-package)
;    ...
;    (define (magnitude z)
;      (sqrt (+ (square (real-part z) (imag-part z))))
;    ...
;    (put 'magnitude 'rectangular magnitude)
;    ...
;    'done)

;  (define (magnitude z)
;    (apply-generic 'magnitude z))


; After Louis implements Mrs. Hacker's suggestion to his complex package the apply-generic function will find the magnitude function under the complex tag, and call the magnitude function (again) on the "contents" of the complex number. Which, because z is the object found in Fig. 2.24, is ('rectangular . (3 . 4)). Magnitude will again invoke apply-generic. This time the magnitude function internal to the rectangular-package will be called on (3 . 4).

; Apply-generic will be called 2 times and the rectangular-package magnitude function is what is finally called.