
let pipe fs = let f a x = x a in let base = f fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base = f in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
(2,29)-(2,30)
(2,45)-(2,49)
(2,47)-(2,49)
*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,29)-(2,30)
(2,34)-(2,77)
(2,45)-(2,46)
(2,45)-(2,49)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
(2,75)-(2,77)
*)
