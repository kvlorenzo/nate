
let pipe fs =
  let f a x b = (b x) a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,19)
(3,18)-(3,21)
(3,23)-(3,24)
(3,28)-(3,70)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,18)-(3,19)
(3,18)-(3,21)
(3,20)-(3,21)
(3,28)-(3,70)
(3,37)-(3,42)
(3,41)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
(3,68)-(3,70)
*)