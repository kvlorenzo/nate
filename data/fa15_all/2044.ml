
let pipe fs =
  let f a x a x = x a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,18)-(3,21)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
