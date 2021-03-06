
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let b = f b in ((b, (b != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(5,28)-(5,63)
(5,39)-(5,40)
(5,44)-(5,62)
(5,55)-(5,56)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,46)-(3,52)
(3,46)-(3,60)
(3,53)-(3,60)
(3,54)-(3,55)
(5,21)-(5,27)
(5,21)-(5,63)
(5,28)-(5,63)
(5,44)-(5,62)
(5,45)-(5,58)
*)

(* all spans
(2,16)-(3,68)
(3,2)-(3,68)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,29)-(3,68)
(3,32)-(3,40)
(3,32)-(3,33)
(3,36)-(3,40)
(3,46)-(3,60)
(3,46)-(3,52)
(3,53)-(3,60)
(3,54)-(3,55)
(3,57)-(3,59)
(3,66)-(3,68)
(5,14)-(5,63)
(5,21)-(5,63)
(5,21)-(5,27)
(5,28)-(5,63)
(5,37)-(5,40)
(5,37)-(5,38)
(5,39)-(5,40)
(5,44)-(5,62)
(5,45)-(5,58)
(5,46)-(5,47)
(5,49)-(5,57)
(5,50)-(5,51)
(5,55)-(5,56)
(5,60)-(5,61)
*)
