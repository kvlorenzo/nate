
let pipe fs =
  let f a x y z = z a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
EMPTY
EmptyG

(3,14)-(3,21)
fun fn -> x (fun a -> a)
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
x
VarG

(3,20)-(3,21)
fun a -> a
LamG VarG

*)
