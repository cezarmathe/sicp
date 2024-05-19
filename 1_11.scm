#!/usr/bin/guile -s
!#

; ~1h

(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (* 2 (f-recursive (- n 2)))
       (* 3 (f-recursive (- n 3))))))

(display (f-recursive 20))
(display "\n")

(define (f-iterative target_n)
  (define (f-iterative-iter n f_n f_nm1 f_nm2)
    (cond
      ((= n target_n) f_n)
      ((< n target_n) (f-iterative-iter (+ n 1)
                            (+ f_n (* 2 f_nm1) (* 3 f_nm2)) ; f(n+1)
                            f_n
                            f_nm1))))
  (if (< target_n 3)
   target_n
   (f-iterative-iter 2 2 1 0)))

(display (f-iterative 20))

