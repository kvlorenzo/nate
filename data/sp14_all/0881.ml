
let pipe fs =
  let f a x = function | f' -> f' x a in
  let base = function | y -> y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,37)
match $x with
| v -> x (a v)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(3,31)-(3,33)
x (a v)
AppG (fromList [AppG (fromList [EmptyG])])

(3,31)-(3,37)
EMPTY
EmptyG

(3,36)-(3,37)
a v
AppG (fromList [VarG])

(4,2)-(4,58)
v
VarG

*)
