; Exercise 1.1
10
;10
(+ 5 3 4)
;12

(- 9 1)
;8

(/ 6 2)
;3

(+ (* 2 4)(- 4 6))
;6

(define a 3)
;a

(define b (+ a 1))
;b

(+ a b( * a b))
;19
(= a b)
;#f
(if (and (> b a )(< b (* a b)))
    b
    a)
;4
(cond ((= a 4) 6)
      ((= b 4)(+ 6 7 a))
      (else 25))
;16
(+ 2 (if (> b a) b a))
;6
(* (cond ((> a b) a)
         ((< a b ) b)
         (else -1)))
;4

;Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
;-37/157


;Exercise 1.3
(define (take-greater x y) (if (> x y) x y))
(define (take-lesser x y) (if (< x y) x y))
(define (sum-of-squares x y) (+ (* x x)(* y y)))
(define (sum-of-some-squares x y z)
  (sum-of-squares
   (take-greater x y)
   (take-greater (take-lesser x y) z)))

;Exercise 1.4
;This operator here is a form that will produce a different result depending on the value of b.  If b is positive, it is the (+) operator, if it is negative, it is the (-) operator.

;Exerise 1.5
;(p) is just a recursive monster that will keep recurring forever.  If it gets evaluated, you will be stuck in an infinite loop until maybe the stack blows or something.  So if (test 0 (p)) is evaluated in applicative order, it will evaluate all of the arguments to `test' before going into the procedure.  So you will hit the infinite loop and be sad.  But in normal order, it will expand the whole thing out without evaluating until everything is expanded.  once `test' is expanded, it will see that x = 0 and return 0 without ever evaulating p
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x) ( < (abs (- (* guess guess) x)) 0.001))
(define (improve guess x) (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2.0))
(define (new-if predicate then-clause else-clause)
  (if (predicate)
      then-clause
      else-clause))
(sqrt-iter 1 2)

;Exercise 1.6
; There is a stack overflow due to too much recursion.  When Scheme starts evaluating a procedure, it evaluates the arguments first and then puts them into the procedure.  This is the applicative order thing we have been talking about.  When using the *if* or *cond* special forms, first the predicate is evaluated, then only the necesary expression is evaluated.  When we write a procedure to wrap if or cond, it has to be done in applicative order.  That means evaluating all of the arguments first.  Our second argument to new-if is a call to sqrt-iter, which must now be evaluated.  It calls new-if, which must now evaluate another call to sqrt-iter, and so on, forever.
 

;Exercise 1.7
;For huuuge numbers, we are going to need to iterate forever.  For tiny ones, we're not even going to be close, proportionally speaking.  Let's try something like this.kjj

(define (sqrt-iter2 guess x)
  (if (good-enough? (improve guess x) x) guess (sqrt-iter2 (improve guess x) x)))
(sqrt-iter2 .00001 .0002)

;Exercise 1.8
(define (improve-cubic guess x)
  (/ (+ (/ x (* guess guess)) (* 2.0 guess)) 3))
(define (good-enough-cubic? guess x)( < (abs (- (* guess guess guess) x)) 0.001))
(define (cubrt-iter guess x)
  (if (good-enough-cubic? guess x) guess (cubrt-iter (improve-cubic guess x) x)))
(cubrt-iter 1 7)
