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


