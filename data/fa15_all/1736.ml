
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let inc f' = f (f b) in inc f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,60)
EMPTY
EmptyG

(5,38)-(5,50)
EMPTY
EmptyG

(5,43)-(5,44)
let f' =
  fun b -> (f b , b = f b) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

(5,43)-(5,50)
EMPTY
EmptyG

(5,45)-(5,50)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(5,54)-(5,57)
EMPTY
EmptyG

(5,54)-(5,59)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

*)
