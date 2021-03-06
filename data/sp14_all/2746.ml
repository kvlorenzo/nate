
let pipe fs =
  let f a x = function | g -> g (a x) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> a (x g) in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,31)
EMPTY
EmptyG

(3,32)-(3,37)
EMPTY
EmptyG

(3,35)-(3,36)
x g
AppG (fromList [VarG])

(4,2)-(4,58)
g
VarG

*)
