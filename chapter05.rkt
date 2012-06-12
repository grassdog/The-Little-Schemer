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


