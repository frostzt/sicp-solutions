; Function definition recursively
(define (recursive n)
  (if (< n 3) n
      (+ (recursive (- n 1)) (* 2 (recursive (- n 2))) (* 3 (recursive (- n 3))))))

; Iterative approach
; The easiest way is to think of a 'while' loop, the function in increasing calls the prevState
; f(4) = f(3) + 2f(2) + 3f(1)
; f(5) = f(4) + 2f(3) + 3f(2), here the last and second last are just first and second for the first
; Therefore there a 3 states to track, currentState, prevState, lastState, with a counter
; The function also says that: f(n - 1) + f(n - 2) + f(n - 3); however this is not to be done here
; since the states can be reassined the prevStates which are automatically substracted by the factor
(define (iterative number)
  (define (iterate currentState prevState lastState counter)
    (cond ((< number 3) number)
	  ((<= counter 0) currentState)	; This is what terminates the while loop
	  (else (iterate (+ currentState (* 2 prevState) (* 3 lastState)) ; update the current state
			 currentState ; pass cur -> prev, same as doing f(n - 2)
			 prevState
			 (- counter 1))))) ; Keep track of the counter
  (iterate 2 1 0 (- number 2))) ; Start with 3 as base case, can't take lower as they return a single value
			   ; counter should be the number - 2 since to get to three it has already ran twice

