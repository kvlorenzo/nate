
let pipe fs =
  let f a x x y = x (a y) in let base m = m in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base m = m in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,25)
EMPTY
EmptyG

*)
