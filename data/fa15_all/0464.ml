
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in b in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(9,4)-(10,69)
EMPTY
EmptyG

(9,17)-(9,27)
(f x , isFPoint x)
TupleG (fromList [AppG (fromList [EmptyG])])

(9,24)-(9,25)
EMPTY
EmptyG

(9,26)-(9,27)
EMPTY
EmptyG

(10,4)-(10,69)
x
VarG

(10,15)-(10,64)
EMPTY
EmptyG

(10,19)-(10,64)
f
VarG

(10,31)-(10,32)
EMPTY
EmptyG

(10,38)-(10,39)
EMPTY
EmptyG

(10,45)-(10,47)
EMPTY
EmptyG

(10,45)-(10,64)
EMPTY
EmptyG

(10,48)-(10,64)
EMPTY
EmptyG

(10,49)-(10,56)
EMPTY
EmptyG

(10,57)-(10,63)
EMPTY
EmptyG

(10,61)-(10,62)
EMPTY
EmptyG

(10,68)-(10,69)
EMPTY
EmptyG

*)
