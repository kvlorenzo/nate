
let sqsum xs =
  let f a x = (a ** 2.) + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,23)
(3,18)-(3,20)
(3,21)-(3,23)
*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,28)
(3,11)-(3,28)
(3,16)-(3,17)
(3,16)-(3,23)
(3,16)-(3,28)
(3,18)-(3,20)
(3,21)-(3,23)
(3,27)-(3,28)
(3,32)-(3,72)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
(3,70)-(3,72)
*)
