
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,45)
fun x -> fun x -> (0 , true)
LamG (LamG EmptyG)

(6,28)-(6,45)
fun x -> (0 , true)
LamG (TupleG [EmptyG,EmptyG])

(6,28)-(6,45)
let func =
  fun x ->
    fun x -> (0 , true) in
(func b , b)
LetG NonRec [LamG EmptyG] (TupleG [EmptyG,EmptyG])

(6,29)-(6,41)
0
LitG

(6,30)-(6,35)
true
LitG

(6,30)-(6,35)
(func b , b)
TupleG [AppG [EmptyG],VarG]

(6,33)-(6,34)
func
VarG

*)