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
;(a 2 (a 3 2))
;(a 2 (a 2 (a 3 1)))
;(a 2 (a 2 2))
;just gonna evaluate this one, thanks
;65536

;What is a concise definition of f, g, and h?
;(define (f n) (a 0 n))
;2n
;(define (g n) (a 1 n))
;2^n
;(define (h n (a 2 n)))
;2^(2^n)


;Exercise 1.11
(define (rec-f n)
  (if (> 3 n) 
	n
	(+ (rec-f (- n 1))
	   (* 2 (rec-f (- n 2 )))
	   (* 3 (rec-f (- n 3)))
	   )
	)
  )



; 1 -> 1
; 2 -> 2
; 3 = 2 + 2 * 1 = 4
; 4 = 4 + 2 * 2 + 3 * 1 = 11
; 5 = 11 + 2 * 4 + 3 * 2 = 25
; 6 = 25 + 2 * 11 + 3 * 4 = 51


(define (iter-f n)
  (define (iter r1 r2 r3 count)
	(if (= 0 count)
	  (+ r1 (* 2 r2) (* 3 r3))
	  (iter (+ r1 (* 2 r2) (* 3 r3)) r1 r2 (- count 1))
	  )	
	)
  (cond ((> 3 n) n)
		((= 3 n) 4)
		(else (iter 4 2 1 (- n 4)))
	)
  )

; Exercise 1.12
(define (pascal row col)
  (if ( or (= row 0) (= 0 col) (= row col))
	1
	(+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))
	)
  )

;Exercise 1.13
; hooboy
;i'm going to assume Fib(1) and Fib(2), since they are defined.
;Fib(3) then takes the place of n=1.  I'm not going to prove that either,
; because I am lazy.
;So assume Fib(n) = (o^n - u^n / (sqrt 5))
;prove: Fib(n + 1) = [o^(n+1) - u ^ (n + 1)] / (sqrt 5)
;Fib(n) + Fib(n-1) = ""
; (o^n - u^n) / (sqrt 5) + (o^ (n-1) - u^(n-1)) / (sqrt 5) = ""
; o^n - u^n + o(n-1) - u^(n-1) = o^(n+1) - u^(n+1)
;"" = o*o^n - u*u^n
;o*o^(n-1) + o(n-1) - u*u^(n-1) - u^(n-1)= ""
;(o + 1) o^(n-1) - (u + 1) u^(n-1) = o^2 * o^(n-1) - u^2 * u^(n-1)
;you can compute that o+1 = o^2 and u+1 = u^2
;so now u proved it
