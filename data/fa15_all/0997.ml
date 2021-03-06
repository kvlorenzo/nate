
let helper (f,b) = let x = f b in match x with | b -> false | _ -> true;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,19)-(2,71)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [LamG EmptyG]) VarG

(2,34)-(2,71)
(x , x <> b)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(2,54)-(2,59)
EMPTY
EmptyG

(2,67)-(2,71)
x <> b
BopG VarG VarG

(4,16)-(5,72)
f
VarG

*)
