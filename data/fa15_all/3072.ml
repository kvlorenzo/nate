
let sqsum xs =
  let f a x = (a + x) ^ 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,25)
EMPTY
EmptyG

(3,19)-(3,20)
x * x
BopG VarG VarG

(3,22)-(3,23)
EMPTY
EmptyG

(3,24)-(3,25)
x
VarG

*)
