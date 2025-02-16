(= (l ()) 0)
(= (l ()))

;; finding the length of an expression
(= (length ()) 0)

(= (length (:: $x $y))
    (+ 1 (length $y))
)

;!(length (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ()))))))

(= (list ())
    ()
)

(= (list ))


(= (append $x $y)
    (cons $x ($y))
)

;!(+ 1 (- 1 2))

(Parent Tom Bob)
(Parent Pam Bob)
(Parent Tom Liz)
(Parent Bob Ann)
(Parent Bob Pat)
(Parent Pat Jim)

(= (get-parents $x)
   (match &self (Parent $y $x) $y))
(= (get-grand-parents $grandchild)
    (match &self
        (Parent $parent $grandchild)
        (get-parents $parent)
    )
)
;! (get-grand-parents Pat)




;;;;;;;;

;;  5. a function to extract all the elements of the above list type into an expresion -- (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (1 2 3 4)

(= (extract ()) ())
(= (extract (:: $x $y)) (cons-atom $x (extract $y)))

! (extract (:: 1 (:: 2 (:: 3 (:: 4 ()))))) ;; (1 2 3 4)






