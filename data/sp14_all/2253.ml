
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((fun (f,b)  -> match f b with | b -> ((f b), false) | _ -> ((f b), true)),
      b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(7,5)-(7,78)
EMPTY
EmptyG

(7,20)-(7,77)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
LamG (IteG EmptyG EmptyG EmptyG)

(7,26)-(7,29)
if b = f b
then (b , false)
else (f b , true)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(7,43)-(7,48)
EMPTY
EmptyG

(7,44)-(7,45)
EMPTY
EmptyG

*)
