
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = f b in ((xx, (xx = b)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,65)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(6,46)-(6,60)
EMPTY
EmptyG

(6,62)-(6,63)
d
VarG

*)
