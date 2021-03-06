
let h x y = ((y x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,8)-(2,30)
EMPTY
EmptyG

(2,13)-(2,18)
EMPTY
EmptyG

(2,14)-(2,15)
x * x
BopG VarG VarG

(2,20)-(2,29)
x
VarG

(7,29)-(7,36)
EMPTY
EmptyG

(7,34)-(7,35)
EMPTY
EmptyG

(7,38)-(7,39)
EMPTY
EmptyG

*)
