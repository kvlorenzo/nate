
let sqsum xs =
  let f a x = a +. (x ** 2.0) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (int_of_float ((float_of_int x) ** 2.0)) in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,29)
(3,21)-(3,22)
(3,21)-(3,29)
*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,29)
(3,11)-(3,29)
(3,15)-(3,16)
(3,15)-(3,29)
(3,21)-(3,22)
(3,21)-(3,29)
(3,23)-(3,25)
(3,26)-(3,29)
(3,34)-(3,74)
(3,45)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
(3,72)-(3,74)
*)
