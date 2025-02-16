;;  1. extract the last element -- e.g., (:: 1 (:: 2 (:: 3 (:: 4 ())))) the last element would be 4

(= (last-element (:: $x ())) $x)
(= (last-element ()) (car-atom last-element))
(= (last-element (:: $x $y)) (last-element $y))
! (last-element (:: 1 (:: 2 (:: 3 (:: 4 ()))))) ;; 4


;;  2. append one more element to the list at the begining -- e. g., adding 0 to the list (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (:: 0(:: 1 (:: 2 (:: 3 (:: 4 ())))))

(= (append-left $elem $list) (:: $elem $list))
! (append-left 0 (:: 1 (:: 2 (:: 3 (:: 4 ()))))) ;; (:: 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))


;;  3. append one more element to the list at the end -- e. g., adding 5 to the list (:: 1 (:: 2 (:: 3 (:: 4 ())))) --> (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ())))))

(= (append-to-end $elem ()) (:: $elem ()))
(= (append-to-end $elem (:: $x $y)) (:: $x (append-to-end $elem $y)))

! (append-to-end 5 (:: 1 (:: 2 (:: 3 (:: 4 ()))))) ;; (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ())))))

