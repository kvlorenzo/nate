
let pipe fs =
  let f a x = (a x) x in let base = (+) 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,19)
x
VarG

(3,14)-(3,21)
fun y -> x (a y)
LamG (AppG [EmptyG])

(3,20)-(3,21)
y
VarG

(3,40)-(3,41)
fun z -> z
LamG VarG

(3,45)-(3,69)
z
VarG

*)
