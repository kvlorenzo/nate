
let pipe fs =
  let f a x = a (fun a  -> x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,31)
EMPTY
EmptyG

*)