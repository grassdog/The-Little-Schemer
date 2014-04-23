; The Little Schemer Chapter 4 Exercises

(load "common.scm")

;(define add1
;  (lambda (n)
;    (+ n 1)))

;(define sub1
;  (lambda (n)
;    (- n 1)))

; My plus first cut
(define myplus
  (lambda (n m)
    (cond
      ((zero? n) m)
      ((zero? m) n)
      (else (myplus (add1 n)
                    (sub1 m))))))

; My plus refined
(define o+
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (o+ n (sub1 m)))))))

; My minus
(define o-
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (o- n (sub1 m)))))))

; Add tuple
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup)
              (addtup (cdr tup)))))))

; Multiplication
(define x
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (o+ n
                (x n (sub1 m)))))))

; Add tuples
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) (quote ()))
      (else (cons (o+ (car tup1) (car tup2))
                  (tup+ (cdr tup1) (cdr tup2)))))))

; Add uneven tuples
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else (cons (o+ (car tup1) (car tup2))
                  (tup+ (cdr tup1) (cdr tup2)))))))

; Greater than
(define o>
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (o> (sub1 n) (sub1 m))))))

; Less than
(define o<
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (o< (sub1 n) (sub1 m))))))

; Equals
(define equal
  (lambda (n m)
    (cond
      ((o> n m) #f)
      ((o< n m) #f)
      (else #t))))

; Raise
(define raiseup
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (x n (raiseup n (sub1 m)))))))

; Divide
(define divide
  (lambda (n m)
    (cond
      ((o< n m) 0)
      (else (add1 (divide (o- n m) m))))))

; List length
(define len
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (len (cdr lat)))))))

; Pick
(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

; Pick remainder
(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n) (cdr lat)))))))

; No numbers
(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat)))))))

; Extract numbers
(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
      (else (all-nums (cdr lat))))))

; Equal atoms
(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (equal a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2)))))

; Count occurences
(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      ((eq? (car lat) a) (add1 (occur a (cdr lat))))
      (else (occur a (cdr lat))))))

; Is one
(define one?
  (lambda (n)
    (cond
      ((zero? (sub1 n)) #t)
      (else #f))))

; Rempick revisited
(define rempick
  (lambda (n lat)
    (cond
      ((one? n) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n) (cdr lat)))))))

