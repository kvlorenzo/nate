
let pipe fs = let f a x d x = a in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)
