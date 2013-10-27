(define check
     (lambda (el_spp el_pill)
           (cond ((and (eq? (car el_spp) (car el_pill)) (>= (cadr el_spp) (cadr el_pill))) #t) 
                  (else #f))))
(define final
     (lambda (el_loi el_pill)
           (cons (car el_loi) (cons (cadr el_loi) (cons (cadr el_pill) (cons (* (cadr el_loi) (cadr el_pill)) '() ))))))
(define main
     (lambda (loi spp pill)
           (cond (           
