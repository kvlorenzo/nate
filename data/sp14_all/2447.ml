
let pipe fs = let f a x = fs x in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
EMPTY
EmptyG

(2,26)-(2,30)
fun p -> x (a p)
LamG (AppG (fromList [EmptyG]))

(2,34)-(2,74)
a p
AppG (fromList [VarG])

(2,45)-(2,46)
fun b -> b
LamG VarG

(2,50)-(2,74)
b
VarG

*)
