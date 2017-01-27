
let pipe fs =
  let f a x = List.map x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,23)
(3,15)-(3,27)
(3,24)-(3,25)
*)

(* type error slice
(3,3)-(3,73)
(3,9)-(3,27)
(3,11)-(3,27)
(3,15)-(3,23)
(3,15)-(3,27)
(3,24)-(3,25)
(3,26)-(3,27)
(3,31)-(3,73)
(3,40)-(3,45)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
(3,71)-(3,73)
*)
