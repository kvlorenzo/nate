
let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base List.rev fs;;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,38)-(3,71)
(3,60)-(3,68)
*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,16)
(3,11)-(3,16)
(3,15)-(3,16)
(3,20)-(3,71)
(3,29)-(3,34)
(3,33)-(3,34)
(3,38)-(3,52)
(3,38)-(3,71)
(3,53)-(3,54)
(3,55)-(3,59)
(3,60)-(3,68)
(3,69)-(3,71)
*)
