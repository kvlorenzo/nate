
let sqsum xs =
  let f a x f _ = a * a in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,13)-(3,24)
(3,15)-(3,24)
(3,23)-(3,24)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,15)-(3,24)
(3,19)-(3,20)
(3,19)-(3,24)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
(3,66)-(3,68)
*)