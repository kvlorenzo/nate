
let pipe fs =
  let f a x x' x a = x (a x') in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,29)
EMPTY
EmptyG

(3,17)-(3,29)
EMPTY
EmptyG

*)
