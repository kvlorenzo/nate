
let pipe fs =
  let f a x = let h::t = fs in h a x in
  let base = [0] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,34)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(3,35)-(3,36)
x (a g)
AppG (fromList [AppG (fromList [EmptyG])])

(4,2)-(4,44)
a
VarG

(4,2)-(4,44)
g
VarG

(4,2)-(4,44)
a g
AppG (fromList [VarG])

(4,14)-(4,15)
fun k -> k
LamG VarG

(4,20)-(4,44)
k
VarG

*)
