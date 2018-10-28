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


;Exercise 1.14
;								cc 11 3
;						11-2										1-3
;			11-1					6-2							1-2				-9-3
;	11-0		6-1				6-1				1-2				1-1		-4-2	*0*
;	*0*	6-0			1-2		6-0		1-1		1-1			-4-2	1-0		0-1 *0*
;		*0*		1-1 -4-2  *0*	1-0 0-1		1-0 0-1		*0*		*0*		*1*
;			1-0 0-1	*0*			*0*	*1*		*1* *0*
;			*1* *0*
;see picture?


;Exercise 1.15
;a. 5 times
;b. time is exponential.  2^(n/3)
;space is constant. this is an iterative process.
;space is also linear.  

;Exercise 1.16
;iterative fast-exp
(define (iter-fast-exp b n)
  (define (do-it b n a)
	(cond ( (= 0 n) a)
		  ((even? n) (do-it b (/ n 2) (* a b b)))
		  (else (do-it b (- n 1) (* a b)))
		  ))
  (do-it b n 1)
  )

;Exercise 1.17
(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (log-multiply a b)
  (cond ( (= b 1) a)
		((even? b) (double   ( log-multiply a (halve b))))
		(else (+ a (log-multiply a (- b 1))))
		)
  )

;Exercise 1.18
(define ( iter* a b acc)
  (cond ((= b 0) acc)
		((even? b) (iter* (double a) (halve b) acc))
		(else (iter* a (- b 1) (+ acc a)))
		)
  )
(define (log* a b) (iter* a b 0))

;Exercise 1.19
;a <- bq + aq + ap, b <- bp + aq
;a1 = bq + aq + ap, b1 = bp + aq
;b2 = p(bp + aq) + q(bq + aq + ap)
; = bp^2 + apq + bq^2 + aq^2 + apq
; = bp^2 + pq^2 + aq^2 + 2apq
; = b(p^2 + q^2) + a(p^2 + 2pq)
; -> p' = p^2 + q^2, q' = p^2 + 2pq

;Exercise 1.20
;normal evaluation
;(gcd 206 40)
;=>if 40 = 0, 260, else gcd 40 (remaineder 206 40)
;=>gcd 40 (remainder 206 40)
;=>if (remainder 206 40) = 0, 40 else (gcd (remainder 206 40 ) (remainder 206 40)
; must evaluate 1 there for the if
; => (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; => evaluate another 2 remainders for the next *if*, get to
; (gcd (remainder 40 (remainder 206 40) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;call these p1 and p2
;(gcd p1 p2)
; => another 4 for the if
;(gcd p2 (remainder p1 p2))
;= > 7 for the if
;then evaluate a, which is p2, which is 4 times
;18 evals

;applicative evaluation
;(gcd 206 40)
;=> if 40 = 0, 206 else gcd 40 (remainder 206 40)
;one eval, gets to
;gcd 40 6
;if = 0 6, 40, else gcd 6 (remainder 40 6)
;now our 2nd eval of remainder
;if (= 0 4), 6, else (gcd 6 (remainder 6 4))
;third eval
;if (= 0 2), 4, else (gcd (remainder 4 2))
;fourth eval
;if (= 0 0) 2
;termiante
;4 evals


;Exercise 1.21
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ( (> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))
		)
  )
(define (divides? a b)
  (= (remainder b a) 0)
  )

(smallest-divisor 199)
;199
(smallest-divisor 1999)
;1999
(smallest-divisor 19999)
;7

;Exercise 1.22
(define (prime? n)
  (= n (smallest-divisor n))
  )

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime (- (runtime) start-time))
	#f
	))
(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time)
  #t
  )
(timed-prime-test 199)
(define (find-next-3-primes x)
  (go-findem x 0)
  )

(define (go-findem x count)
  (if (= count 3)
	#t
	(go-findem (+ x 1) (if (timed-prime-test x)  (+ count 1) count))
	)
  )

(find-next-3-primes 1000)
;taking less than a milisecond
(find-next-3-primes 100000)
;same

(find-next-3-primes 100000000)
;at this point i can see 2-3 e -2 milliseconds
(find-next-3-primes 1000000000)
;here they are .08 or so ms, around 3-4 times as long
(find-next-3-primes 10000000000)
;these are .2-.3, around 3 times as long
(find-next-3-primes 100000000000)
;0.7, again about right.  I think the big O notation is borne out 
;on my machine
