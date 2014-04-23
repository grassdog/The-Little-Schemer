;;; Define atom? for The Little Schemer examples

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

