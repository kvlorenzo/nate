
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun (f,b)  -> if (f b) = b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,29)-(5,73)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(5,62)-(5,63)
(b , true)
TupleG (fromList [VarG,LitG])

(5,69)-(5,70)
true
LitG

(5,69)-(5,72)
EMPTY
EmptyG

(5,71)-(5,72)
(b , false)
TupleG (fromList [VarG,LitG])

(5,75)-(5,76)
false
LitG

*)
