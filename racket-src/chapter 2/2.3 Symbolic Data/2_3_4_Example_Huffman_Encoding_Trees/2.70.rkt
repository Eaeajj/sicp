#lang racket

(require "2.68.rkt")
(require "2.69.rkt")

(define tree (generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3)
                                            (GET 2) (YIP 9) (JOB 2) (WAH 1))))
(define message '(GET A JOB
                      SHA NA NA NA NA NA NA NA NA
                      GET A JOB
                      SHA NA NA NA NA NA NA NA NA
                      WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                      SHA BOOM))

(printf "~a bits are needed to encode this message using the Huffman encoding.\n" (length (encode message tree)))
(printf "~a bits would be needed to encode this message using a fixed-length code.\n" (* 3 (length message)))