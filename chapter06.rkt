; The Little Schemer Chapter 6 Exercises

(load "common.rkt")

(load "chapter04.rkt")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) (quote +)) (and (numbered? (car exp)) (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) (quote x)) (and (numbered? (car exp)) (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) (quote raiseup)) (and (numbered? (car exp)) (numbered? (car (cdr (cdr aexp)))))))))

; Improved given we know aexp is an aritmetic expression
(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else (and (numbered? (car exp))
                 (numbered? (car (cdr (cdr aexp)))))))))

(define value
  (lambda (nexp)
    (cond
      ((atom? aexp) nexp)
      ((eq? (car (cdr nexp)) (quote +)) (+ (value (car nexp)) (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) (quote x)) (x (value (car nexp)) (value (car (cdr (cdr nexp))))))
      (else (raiseup (value (car nexp)) (value (car (cdr (cdr nexp)))))))))

(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

(define operator
  (lambda (aexp)
    (car aexp)))

; Redefine value
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) (quote +))
        (+ (value (1st-sub-exp nexp))
           (value (2nd-sub-exp nexp))))
      ((eq? (operator nexp) (quote x )) (x (value (1st-sub-exp nexp))
                                                  (value (2nd-sub-exp nexp))))
      (else (raiseup (value (1st-sub-exp nexp))
                     (value (2nd-sub-exp nexp)))))))

; Alternative number representation
(define sero?
  (lambda (n)
    (null? n)))

(define edd1
  (lambda (n)
    (cons '() n)))

(define zub1
  (lambda (n)
    (cdr n)))

