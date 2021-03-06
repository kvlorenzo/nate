
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let f' (f,b) = ((f b), (b = (f b))) in ((f' (f, b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(6,9)-(6,66)
(let f' =
   fun b -> (f b , b = f b) in
 f' , b)
TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])

(6,18)-(6,45)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(6,49)-(6,65)
EMPTY
EmptyG

(6,50)-(6,61)
EMPTY
EmptyG

(6,54)-(6,60)
EMPTY
EmptyG

(6,55)-(6,56)
EMPTY
EmptyG

(6,63)-(6,64)
EMPTY
EmptyG

*)
