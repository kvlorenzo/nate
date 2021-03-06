
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,44)
EMPTY
EmptyG

(5,29)-(5,40)
EMPTY
EmptyG

(5,30)-(5,33)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(5,34)-(5,39)
fun x ->
  (let xx = f x in
   (xx , xx <> b))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,37)-(5,38)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(5,42)-(5,43)
(g , b)
TupleG (fromList [VarG])

*)
