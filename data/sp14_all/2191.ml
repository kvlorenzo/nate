
let rec wwhile (f,b) =
  let check = f b in
  match (f, b) with | (x,y) -> if y = false then x else wwhile (f, x);;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,8)-(4,14)
EMPTY
EmptyG

(4,9)-(4,10)
EMPTY
EmptyG

(4,12)-(4,13)
check
VarG

*)
