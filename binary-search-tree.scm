(define (make-empty-bst) '())
(define (empty-bst? bst) (null? bst))
(define (make-bst val ls rs)(list val ls rs) )
(define (bst-v bst)(car bst))
(define (bst-ls bst)(cadr bst))
(define (bst-rs bst)(caddr bst))
(define (leaf-bst? bst)(and (empty-bst? (bst-rs bst)) (empty-bst? (bst-ls bst))))
(define (size-bst bst)
	(cond ((empty-bst? bst) 0)
		    (else (+ 1 (size-bst (bst-ls bst)) (size-bst (bst-rs bst))))))
(define (insert-bst bst val)
	(cond ((empty-bst? bst)(make-bst val '() '()))
		((> (bst-v bst) val)(make-bst (bst-v bst) (insert-bst (bst-ls bst) val) (bst-rs bst)))
		((< (bst-v bst) val)(make-bst (bst-v bst) (bst-ls bst) (insert-bst (bst-rs bst) val)))))
(define (right-most bst)
	(cond ((empty-bst? bst) (make-empty-bst))
		((empty-bst? (bst-rs bst))  bst)
		(else (right-most (bst-rs bst)))))
(define (left-most bst)
	(cond ((empty-bst? bst) (make-empty-bst))
		((empty-bst? (bst-ls bst)) (bst-v  bst))
		(else (left-most (bst-ls bst)))))

(define (inserttree bst lst)
	(cond ((null? lst) bst)
		(else (inserttree (insert-bst bst (car lst)) (cdr lst)))))
(define (delete bst val)
	(cond ((< (bst-v bst) val)(make-bst (bst-v bst) (bst-ls bst) (delete (bst-rs bst) val)))
		((> (bst-v bst) val)(make-bst (bst-v bst) (delete (bst-ls bst) val) (bst-rs bst)))
		((= val (bst-v bst))
			        (cond ((leaf-bst? bst) (make-empty-bst))
			        	((empty-bst? (bst-rs bst)) (bst-ls bst))
			        	(else (make-bst  (left-most (bst-rs bst)) (bst-ls bst) (delete (bst-rs bst) (left-most (bst-rs bst)))))))))
(define (sort bst)
	(cond ((empty-bst? bst) '())
		(else (cons (left-most bst) (sort (delete bst (left-most bst)))))))
