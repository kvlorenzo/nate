
let pipe fs = let f a x = fs a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,77)
*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,31)
(2,23)-(2,31)
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,77)
(2,44)-(2,49)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
(2,75)-(2,77)
*)