
let pipe fs =
  let f a x = let y z xn = xn a in y in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,36)
EMPTY
EmptyG

(3,20)-(3,31)
EMPTY
EmptyG

(3,22)-(3,31)
fun c -> x c
LamG (AppG (fromList [EmptyG]))

(3,27)-(3,29)
EMPTY
EmptyG

(3,30)-(3,31)
EMPTY
EmptyG

(3,35)-(3,36)
x
VarG

(4,2)-(4,44)
c
VarG

*)
