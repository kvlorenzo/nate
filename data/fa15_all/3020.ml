
let pipe fs = let f a x x = x a in let base c = c in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base c = c in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

*)