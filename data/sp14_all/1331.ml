
let pipe fs =
  let f a x x' y = (x a) + a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,28)
EMPTY
EmptyG

(3,15)-(3,28)
EMPTY
EmptyG

(3,19)-(3,28)
fun a -> x a
LamG (AppG (fromList [EmptyG]))

(3,27)-(3,28)
EMPTY
EmptyG

*)
