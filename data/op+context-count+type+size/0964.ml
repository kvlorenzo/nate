
let pipe fs =
  let f a x = a = (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,23)
(3,22)-(3,23)
(3,28)-(3,70)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,23)
(3,11)-(3,23)
(3,15)-(3,16)
(3,15)-(3,23)
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