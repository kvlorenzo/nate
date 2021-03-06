
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(5,28)-(5,66)
EMPTY
EmptyG

(5,40)-(5,61)
fun b -> (f b , f b <> b)
LamG (TupleG (fromList [EmptyG]))

*)
