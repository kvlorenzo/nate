
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let h a = ((f a), false) in h b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,28)-(5,66)
EMPTY
EmptyG

(5,36)-(5,54)
fun x -> (f x , false)
LamG (TupleG (fromList [EmptyG]))

(5,44)-(5,45)
x
VarG

(5,58)-(5,61)
(h , b)
TupleG (fromList [VarG])

(5,64)-(5,65)
EMPTY
EmptyG

*)
