
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g z = (z, false) in ((g b), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
fun x -> (x * x , x < 100)
LamG (TupleG (fromList [EmptyG]))

(5,28)-(5,64)
EMPTY
EmptyG

(5,35)-(5,49)
EMPTY
EmptyG

(5,40)-(5,41)
EMPTY
EmptyG

(5,43)-(5,48)
EMPTY
EmptyG

(5,53)-(5,63)
EMPTY
EmptyG

(5,54)-(5,59)
EMPTY
EmptyG

(5,55)-(5,56)
EMPTY
EmptyG

(5,57)-(5,58)
h
VarG

*)
