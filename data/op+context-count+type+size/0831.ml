
let pipe fs = let f a x = fs a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,31)
(2,23)-(2,31)
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,75)
(2,46)-(2,47)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
(2,68)-(2,72)
(2,73)-(2,75)
*)
