
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = function | [] -> fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
EMPTY
EmptyG

(3,31)-(3,32)
EMPTY
EmptyG

(3,45)-(3,46)
EMPTY
EmptyG

(3,45)-(3,48)
EMPTY
EmptyG

(3,47)-(3,48)
a
VarG

(4,13)-(4,32)
fun fs -> fs
LamG VarG

*)
