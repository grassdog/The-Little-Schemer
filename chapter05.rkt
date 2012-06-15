; The Little Schemer Chapter 5 Exercises

(load "common.rkt")

; Remove member in a S-expression
(define rember*
  (lambda (a l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
        (cond
          ((eq? (car l) a) (rember* a (cdr l)))
          (else (cons (car l)
                      (rember* a (cdr l)))))
      (else (cons (rember* a (car l))
                  (rember* a (cdr l))))))))

; Insert right in a S-expression
(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) (quote()))
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons old (cons new
                                             (insertR* new old (cdr l)))))
          (else (cons (car l)
                      (insertR* new old (cdr l))))))
      (else (cons (insertR* new old (car l))
                  (insertR* new old (cdr l)))))))

; Occurrence count on a S-expression
(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
        (cond
          ((eq? (car l) a) (add1 (occur* a (cdr l))))
          (else (occur* a (cdr l)))))
      (else (+ (occur* a (car l))
               (occur* a (cdr l)))))))

; Substitute in a S-expression
(define subst*
  (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons new
                                   (subst* new old (cdr l))))
          (else (cons (car l)
                      (subst* new old (cdr l))))))
      (else (cons (subst* (car l))
                  (subst* (cdr l)))))))


; Insert left in a S-expression
(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l))
        (cond
          ((eq? (car l) old) (cons new
                                   (cons old
                                         (insertL* new old (cdr l)))))
          (else (cons (car l)
                      (insertL* new old (cdr l))))))
      (else (cons (insertL* new old (car l))
                  (insertL* new old (cdr l)))))))

; Member in a S-expression
(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l))
        (or (eq? (car l) a)
            (member* a (cdr l))))
      (else (or (member* a (car l))
                (member* a (cdr l)))))))

; Leftmost atom in a S-expression that doesn't contain empty lists
(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else (leftmost (car l))))))

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (= a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2)))))

; List equality (using eqan)
(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      ((and (atom? (car l1)) (atom? (car l2))) (and (eqan? (car l1) (car l2))
                                                    (eqlist? (cdr l1) (cdr l2))))
      ((or (atom? (car l1)) (atom? (car l2))) #f)
      (else (and (eqlist? (car l1) (car l2))
                 (eqlist? (cdr l2) (cdr l2)))))))

(define myequal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1) (atom? s2)) (eqan? s1 s2))
      ((or (atom? s1) (atom? s2)) #f)
      (else (eqlist? s1 s2)))))


(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      (else (and (myequal? (car l1) (car l2))
                 (eqlist? (cdr l2) (cdr l2)))))))


