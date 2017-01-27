
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile ((not (f b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,31)-(6,34)
(6,31)-(6,39)
(6,31)-(6,44)
(6,36)-(6,37)
(6,36)-(6,39)
(6,43)-(6,44)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(4,53)-(4,55)
(6,22)-(6,28)
(6,22)-(6,44)
(6,31)-(6,34)
(6,31)-(6,39)
(6,31)-(6,44)
(6,43)-(6,44)
*)
