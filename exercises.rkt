;;; The Little Schemer

;;; Define atom? for The Little Schemer examples

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

; Remaining member
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                          (rember a
                             (cdr lat)))))))))

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
       (cons old
             (cons new (cdr lat))))
      (else (cons (car lat)
                  (insertR new old
                           (cdr lat)))))))

; Insert to the left
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old)
       (cons new lat))
      (else (cons (car lat)
                  (insertL new old
                           (cdr lat)))))))

; Substitute
(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) old)
               (cons new (cdr lat)))
              (else (cons (car lat)
                          (subst new old (cdr lat)))))))))

; my plus
(define myplus
  (lambda (a b)
    (cond
      ((zero? b) a)
      ((zero? a) b)
      (else
       (myplus (add1 a) (sub1 b))))))

; my plus refined
(define o+
  (lambda (a b)
    (cond
      ((zero? b) a)
      (else
       (add1 (o+ a (sub1 b)))))))

(define o-
  (lambda (a b)
    (cond
      ((zero? b) a)
      (else
       (sub1 (o- a (sub1 b)))))))

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else
       (+ (car tup) (addtup (cdr tup)))))))

(define ox
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else
       (+ n (ox n (sub1 m)))))))

; Will only work on identical length tups
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) '())
      (else
       (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

; This will work on variable length tups
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) '())
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
       (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

(define o>
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (o> (sub1 n) (sub1 m))))))

(define mylength
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (mylength (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else
       (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((number? (car lat))
           (no-nums (cdr lat)))
          (else
           (cons (car lat) (no-nums (cdr lat)))))))))

(define allnums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((number? (car lat)) (cons (car lat) (allnums (cdr lat))))
         (else
          (allnums (cdr lat))))))))


(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2))  (= a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2)))))

(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else
       (cond
         ((eq? (car lat) a) (add1 (occur a (cdr lat))))
         (else (occur a (cdr lat))))))))

(define one?
  (lambda (n)
    (cond
      (else (= n 1)))))

(define one?
  (lambda (n)
    (= n 1)))


(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond (eq? (car l) a) (add1 (occur* a (cdr l))))
       (else
        (occur* a (cdr l)))))
    (else (+ (occur* a (car l))
             (occur* a (cdr l))))))

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old) (cons new (subst* new old (cdr l))))
         (else (cons (car l) (subst* new old (cdr l))))))
      (else
       (cons (subst* new old (car l))
             (subst* new old (cdr l)))))))
