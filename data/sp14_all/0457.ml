
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,45)
EMPTY
EmptyG

(5,29)-(5,41)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,30)-(5,35)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,33)-(5,34)
x
VarG

(5,39)-(5,40)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(5,43)-(5,44)
(g , b)
TupleG (fromList [VarG])

*)
