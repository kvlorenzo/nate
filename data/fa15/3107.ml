
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then false else true in wwhile (helper, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,35)-(5,40)
(5,46)-(5,50)
*)

(* type error slice
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,72)
(5,13)-(5,50)
(5,17)-(5,50)
(5,46)-(5,50)
(5,54)-(5,60)
(5,54)-(5,72)
(5,61)-(5,72)
(5,62)-(5,68)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,44)-(2,77)
(2,47)-(2,49)
(2,55)-(2,69)
(2,55)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(2,75)-(2,77)
(4,14)-(5,72)
(5,2)-(5,72)
(5,13)-(5,50)
(5,17)-(5,50)
(5,20)-(5,29)
(5,20)-(5,25)
(5,21)-(5,22)
(5,23)-(5,24)
(5,28)-(5,29)
(5,35)-(5,40)
(5,46)-(5,50)
(5,54)-(5,72)
(5,54)-(5,60)
(5,61)-(5,72)
(5,62)-(5,68)
(5,70)-(5,71)
*)
