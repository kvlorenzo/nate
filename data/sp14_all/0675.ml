
let pipe fs = let f a x x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
fun a -> a
LamG VarG

*)
