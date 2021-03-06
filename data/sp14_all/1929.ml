
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = if b != (f b) then let b = f b in wwhile (f, b) else b;;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) =
  if b = (f b) then f b else (let g b = ((f b), true) in wwhile (g, (f b)));;

*)

(* changed spans
(7,24)-(7,34)
b = f b
BopG VarG (AppG (fromList [EmptyG]))

(7,40)-(7,68)
EMPTY
EmptyG

(7,55)-(7,61)
wwhile (g , f b)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,55)-(7,68)
let g =
  fun b -> (f b , true) in
wwhile (g , f b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,63)-(7,64)
f b
AppG (fromList [VarG])

(7,74)-(7,75)
EMPTY
EmptyG

*)
