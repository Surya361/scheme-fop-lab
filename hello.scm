(define remove
      (lambda (num lst)
           (cond ((null?  lst) lst)
                 ((= num (car lst)) (cdr lst))
                 (else (cons (car lst) (remove num (cdr lst)))))))
(define find-min
      (lambda (lst)
            (cond ((null? (cdr lst)) car lst)
                  ((> (car lst) (cadr lst)) (find-min (cdr lst)))
                  (else (find-min (remove (cadr lst) lst))))))
(define sort
      (lambda (lst1)
          (cond  ((null? lst1) lst1)
                 (else (cons (car (find-min lst1)) (sort (remove (car (find-min lst1)) lst1)))))))
(define main
      (lambda (lot)
         (remove (car (find-min lot)) lot)))
(define odd
      (lambda (lst) 
          (cond ((null? lst) lst)
                ((= (remainder (car lst) 2) 0)(odd (cdr lst)))
                (else (cons (car lst) (odd (cdr lst)))))))
(define duplicate 
      (lambda (lst)
           (cond ((null? lst) lst)
                 (else (cons (car lst) (cons (car lst) (duplicate (cdr lst))))))))
(define last
      (lambda (lst)
           (car (reverse lst))))
(define insert
     (lambda (index lst numb a)
             (cond ((= a index) (cons numb lst))
                  (else (cons (car lst) (insert index (cdr lst) numb (+ a 1)))))))
(define insert 
     lambda (index lst numb)
            (li
