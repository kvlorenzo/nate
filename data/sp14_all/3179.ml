
let pipe fs = let f a x f = f x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
EMPTY
EmptyG

(2,28)-(2,29)
EMPTY
EmptyG

(2,28)-(2,31)
EMPTY
EmptyG

*)
