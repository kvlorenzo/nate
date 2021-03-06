
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let g = f b in ((f, (g < b)), b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,62)
let n =
  fun x ->
    (let ff = f b in
     (ff , b = ff)) in
(n , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(6,37)-(6,40)
fun x ->
  (let ff = f b in
   (ff , b = ff))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(6,45)-(6,57)
EMPTY
EmptyG

(6,46)-(6,47)
EMPTY
EmptyG

(6,49)-(6,56)
EMPTY
EmptyG

(6,50)-(6,51)
ff
VarG

(6,54)-(6,55)
b = ff
BopG VarG VarG

(6,59)-(6,60)
(n , b)
TupleG (fromList [VarG])

*)
