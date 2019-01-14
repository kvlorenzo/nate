
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,17)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,16)-(3,17)
a y
AppG (fromList [VarG])

(3,21)-(3,70)
y
VarG

(3,40)-(3,42)
fun i -> i
LamG VarG

(3,46)-(3,70)
i
VarG

*)
