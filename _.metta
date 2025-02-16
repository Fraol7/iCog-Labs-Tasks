(= (foo A)
    (A foo)
)
(= (foo)
    (No foo)
)
(= (foo B)
    (B foo)
)

; ! (foo $x)
;; list type data structure in metta

(:: 1 (:: 2 (:: 3 ())))

;; making use of the pattern to write a function that calculates the length of a function

(= (length ()) 0)

(= (length (:: $x $y))
    (+ 1 (length $y))
)

! (length (:: 1 (:: 2 (:: 3 (:: 4 ()))))) ;; 4

;; Tasks
;;  1. extract the last element -- e.g., (:: 1 (:: 2 (:: 3 (:: 4 ())))) the last element would be 4
;;  2. append one more element to the list at the begining -- e. g., adding 0 to the list (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (:: 0(:: 1 (:: 2 (:: 3 (:: 4 ())))))
;;  3. append one more element to the list at the end -- e. g., adding 5 to the list (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ())))))
;;  4. write a function to find the length without the use of the :: symbol
;;  5. a function to extract all the elements of the above list type into an expresion -- (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (1 2 3 4)

;;  car-atom, cdr-atom, const-atom

! (car-atom (1 2 3 4)) ;; 1
! (cdr-atom (1 2 3 4)) ;; (2 3 4)
! (cdr-atom (4)) ;; ()
! (cons-atom A (B)) ;; (A B)

;; using let bining single variable and multiple variables, below consecutively
! (let $a (1 3 4) (car-atom $a)) ;; 1

! (let*
    (
        ($a (2 3 4))
        ($b (4 5 6))
    )
    (+ (car-atom $a) (car-atom $b))
    )
;; Tasks

;;  6.  finding length of an expression of the form (A B C) -- 3
;;  7.  finding an expression containing sum of two numeric expressions (including length checking conditions -- a plus)
;;  8.  select by index function , e.g., in (1 3 4) (funct (1 3 4) 0) -- 1
;;  9.  slicing an expression by index
;;  10. Reconstruct an expression using car-atom, cdr-atom and cons-atom
;; make use of the println! function to show reconstruction variable outputs
;; eg
; for (B 4 5 3) -- original expression
; B
; 4
; 5
; 3
; (3)
; (5 3)
; (4 5 3)
; (B 4 5 3) -- reconstructed expression

;; Use of unify for pattern matching

! (let $a (A 3 4) (unify $a ($x $y $z) (* 2 $x) (No match))) ;; 8

;; bonus -- insering a node to this list -- insert node D to (:: A (:: B (:: C ()))) -- >(:: A (:: B (:: D (:: C ()))))