
let pipe fs =
  let f a x c = c (x a) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,18)
(3,20)-(3,23)
(3,22)-(3,23)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,17)-(3,18)
(3,17)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
(3,28)-(3,70)
(3,37)-(3,42)
(3,41)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
(3,68)-(3,70)
*)
