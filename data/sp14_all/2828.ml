
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (fun b  -> ((f b), ((f b) != b), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), (b != (f b)))), b);;

*)

(* changed spans
(6,28)-(6,64)
(fun b ->
   (f b , b <> f b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(6,39)-(6,63)
(f b , b <> f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,48)-(6,53)
b
VarG

(6,61)-(6,62)
EMPTY
EmptyG

*)
