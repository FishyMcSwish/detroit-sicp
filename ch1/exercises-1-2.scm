; Exercise 1.9
;(define (+ a b)
;  (if (= a 0)
;	b
;	(inc (+ (dec a) b ))
;	)
;  )

;(define (+ a b)
;  (= a 0)
;  b
;  (+ (dec a) (inc b))
;  )
;top one is a recursive process
;(+ 3 3) 
;(inc (+ 2 3)) 
;(inc (inc (+ 1 3))) 
; (inc (inc (inc + 0 3))) 
; (inc (inc (inc 3)))
; (inc (inc 4))
; (inc 5)
; 6
;
;bottom one is iterative (or tail-recursive)
;(+ 3 3)
;(+ 2 4) 
;(+ 1 5)
;(+ 0 6)
;6

;Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1) (A x (- y 1))))
		)
  )

(a 1 10)
;(a 0 (a 1 9))
;(a 0 (a 0 (a 1 8)))
; ... 9x nested until (a 1 1) , = 2^10
;1024
(a 2 4)
;(a 1 (a 2 3))
;(a 1 (a 1 (a 2 2)))
;(a 1 (a 1 (a 1 (a 2 1)))) 
;(a 1 (a 1 (a 1 2)))
;(a 1 (a 1 (a 0 (a 1 1))))
;(a 1 (a 1 (a 0 2)))
;(a 1 (a 1 4))
;(a 1 (a 0 (a 1 3)))
;(a 1 (a 0 (a 0 (a 1 2)))
;(a 1 (a 0 (a 0 (a 0 (a 1 1)))
;(a 1 (a 0 (a 0 (a 0 2))
;(a 1 (a 0 (a 0 4)
;(a 1 (a 0 8))
;(a 1 16)
;pattern recognition says (a 1 x) = 2 ^ x
;65536
(a 3 3)
;just gonna evaluate this one, thanks
;65536

;What is a concise definition of f, g, and h?
;(define (f n) (a 0 n))
;2n
;(define (g n) (a 1 n))
;2^n
;(define (h n (a 2 n)))
;2^(2^n)
