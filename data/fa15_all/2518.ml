
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func b), b);;


(* fix

let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func input = ((f input), ((f input) = b)) in func), b);;

*)

(* changed spans
(6,60)-(6,66)
EMPTY
EmptyG

(6,69)-(6,70)
EMPTY
EmptyG

*)
