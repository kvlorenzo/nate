
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile ((let g x = (f x) != x in g b), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,40)-(7,50)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,49)-(7,50)
EMPTY
EmptyG

(7,54)-(7,55)
(xx , xx <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(7,54)-(7,57)
EMPTY
EmptyG

(7,56)-(7,57)
xx <> b
BopG VarG VarG

(7,60)-(7,61)
g
VarG

*)
