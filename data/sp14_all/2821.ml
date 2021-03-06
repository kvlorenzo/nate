
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,58)
EMPTY
EmptyG

(6,29)-(6,57)
b
VarG

(6,32)-(6,37)
fun b -> (f b , f b = b)
LamG (TupleG (fromList [EmptyG]))

(6,32)-(6,41)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,40)-(6,41)
EMPTY
EmptyG

(6,47)-(6,57)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

*)
