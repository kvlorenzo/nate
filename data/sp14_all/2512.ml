
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b), ((g b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,73)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(7,39)-(7,42)
let xx = f x in (xx , xx <> b)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(7,47)-(7,68)
EMPTY
EmptyG

(7,48)-(7,53)
EMPTY
EmptyG

(7,49)-(7,50)
EMPTY
EmptyG

(7,51)-(7,52)
xx
VarG

(7,56)-(7,61)
EMPTY
EmptyG

(7,57)-(7,58)
EMPTY
EmptyG

(7,59)-(7,60)
xx
VarG

(7,70)-(7,71)
g
VarG

*)
