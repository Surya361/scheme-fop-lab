(define fqcy
    (lambda (lst n)
           (cond ((null? lst) 0)
                  ((not (= (car lst) n)) (fqcy (cdr lst) n))
                  (else (+ 1 (fqcy (cdr lst) n))))))
