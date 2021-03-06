
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint x = ((f x) - x) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test (f b)), false) in
  wwhile (isFPoint, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in (x, (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(4,53)-(4,54)
let gs =
  fun x ->
    (let isFPoint =
       fun x -> (f x - x) < 0 in
     (x , isFPoint x)) in
wwhile (gs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(8,2)-(9,22)
EMPTY
EmptyG

(8,15)-(8,74)
EMPTY
EmptyG

(8,19)-(8,74)
EMPTY
EmptyG

(8,22)-(8,30)
EMPTY
EmptyG

(8,22)-(8,32)
EMPTY
EmptyG

(8,31)-(8,32)
EMPTY
EmptyG

(8,42)-(8,46)
EMPTY
EmptyG

(8,53)-(8,74)
EMPTY
EmptyG

(8,55)-(8,59)
EMPTY
EmptyG

(8,60)-(8,65)
EMPTY
EmptyG

(8,61)-(8,62)
x
VarG

(8,63)-(8,64)
EMPTY
EmptyG

(8,68)-(8,73)
isFPoint
VarG

(9,10)-(9,18)
gs
VarG

*)
