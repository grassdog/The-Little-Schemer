; The Little Schemer Chapter 3 Exercises

(load "common.scm")

; Remove a member
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat)
                  (rember a (cdr lat)))))))

; Grab first item from each element in a list
(define firsts
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons (car (car l)) (firsts (cdr l)))))))

; Insert to the right
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old)
       (cons old (cons new (cdr lat))))
      (else
        (cons (car lat)
              (insertR new old (cdr lat)))))))

; Insert to the left
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote()))
      ((eq? (car lat) old)
       (cons new lat))
      (else
        (cons (car lat)
              (insertL new old (cdr lat)))))))

; Substitute
(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new (cdr lat)))
      (else (cons (car lat)
                  (subst new old (cdr lat)))))))

; Substitute two
(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) (quote()))
      ((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
      (else (cons (car lat)
                  (subst2 new o1 o2 (cdr lat)))))))

; Remove all members
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (multirember a (cdr lat)))
      (else (cons (car lat)
                  (multirember a (cdr lat)))))))

; Multi insert right
(define mutliinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons old
                                 (cons new (multiinsertR new old (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertR new old (cdr lat)))))))

; Multi insert left
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new
                                 (cons old
                                       (multiinsertL new old (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertL new old (cdr lat)))))))

; Multi substitute
(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
      (else (cons (car lat)
                  (multisubst new old (cdr lat)))))))

