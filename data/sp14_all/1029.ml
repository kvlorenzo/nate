
let pipe fs =
  let f a x l = l (x a) in let base p = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x l = x (a l) in let base p = p in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
EMPTY
EmptyG

(3,18)-(3,23)
EMPTY
EmptyG

(3,21)-(3,22)
a l
AppG (fromList [VarG])

(3,27)-(3,69)
l
VarG

*)
