
let pipe fs = let f a x a = a x in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = a in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,31)
EMPTY
EmptyG

(2,30)-(2,31)
EMPTY
EmptyG

*)
