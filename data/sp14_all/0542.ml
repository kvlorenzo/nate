
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) != b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,29)-(4,46)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
IteG (BopG EmptyG EmptyG) (LamG EmptyG) (LamG EmptyG)

(4,30)-(4,31)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

(4,33)-(4,45)
b
VarG

(4,34)-(4,39)
fun b'' -> (f b , false)
LamG (TupleG (fromList [EmptyG]))

(4,43)-(4,44)
fun b'' -> (f b , true)
LamG (TupleG (fromList [EmptyG]))

(4,48)-(4,49)
true
LitG

*)
