
let sqsum xs =
  let f a x = (a * a) + xs in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,16)-(3,17)
(3,20)-(3,21)
(3,25)-(3,27)
*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,27)
(3,11)-(3,27)
(3,16)-(3,17)
(3,16)-(3,21)
(3,16)-(3,27)
(3,25)-(3,27)
(3,31)-(3,71)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
(3,69)-(3,71)
*)