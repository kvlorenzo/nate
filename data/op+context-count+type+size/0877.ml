
let pipe fs =
  let f a x x' y = (x a) + a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,29)
(3,16)-(3,29)
(3,21)-(3,29)
(3,28)-(3,29)
*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,16)-(3,29)
(3,21)-(3,22)
(3,21)-(3,24)
(3,21)-(3,29)
(3,23)-(3,24)
(3,28)-(3,29)
(3,33)-(3,75)
(3,42)-(3,47)
(3,46)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
(3,73)-(3,75)
*)