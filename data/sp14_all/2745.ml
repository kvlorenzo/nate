
let pipe fs =
  let f a x = function | g -> g x in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,33)
EMPTY
EmptyG

(3,32)-(3,33)
EMPTY
EmptyG

*)
