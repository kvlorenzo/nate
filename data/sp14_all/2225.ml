
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) = wwhile (((f b), (b <> (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
EMPTY
EmptyG

(5,21)-(5,54)
let f =
  fun b ->
    (let b' = f b in
     (b' , f b <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,28)-(5,54)
f
VarG

(5,29)-(5,50)
b
VarG

(5,30)-(5,35)
f b <> b
BopG (AppG (fromList [EmptyG])) VarG

(5,37)-(5,49)
EMPTY
EmptyG

(5,44)-(5,45)
(f , b)
TupleG (fromList [VarG])

(5,52)-(5,53)
EMPTY
EmptyG

*)
