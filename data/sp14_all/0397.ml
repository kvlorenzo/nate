
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
f
VarG

(5,21)-(5,48)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(5,28)-(5,48)
b
VarG

(5,29)-(5,44)
xx <> b
BopG VarG VarG

(5,46)-(5,47)
EMPTY
EmptyG

*)
