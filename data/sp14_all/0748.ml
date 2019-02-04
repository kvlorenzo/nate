
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h = f in ((h, false), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,37)-(5,38)
fun x -> (f x , false)
LamG (TupleG (fromList [EmptyG]))

(5,43)-(5,53)
f x
AppG (fromList [VarG])

(5,47)-(5,52)
EMPTY
EmptyG

*)
