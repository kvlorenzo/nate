
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,8)
EMPTY
EmptyG

(6,2)-(6,59)
EMPTY
EmptyG

(6,9)-(6,59)
let helper =
  fun x ->
    if b = f b
    then (b , false)
    else (b , true) in
wwhile (helper , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,10)-(6,55)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,57)-(6,58)
wwhile (helper , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
