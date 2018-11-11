
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b) != b), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,28)-(7,64)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(7,39)-(7,42)
let xx = f x in (xx , xx <> b)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(7,47)-(7,59)
xx
VarG

(7,51)-(7,52)
xx
VarG

(7,61)-(7,62)
g
VarG

*)
