
let pipe fs = let f a x a x = a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(2,46)-(2,47)
fun x -> x
LamG VarG

(2,51)-(2,75)
x
VarG

*)
