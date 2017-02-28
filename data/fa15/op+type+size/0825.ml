
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun input  -> let b = f input in ((b, (b != input)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun input  -> let b = f input in (b, (b != input))), b);;

*)

(* changed spans
(6,9)-(6,66)
(6,24)-(6,65)
(6,44)-(6,61)
*)

(* type error slice
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(6,2)-(6,8)
(6,2)-(6,66)
(6,9)-(6,66)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,30)-(3,63)
(3,33)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(6,66)
(6,2)-(6,66)
(6,2)-(6,8)
(6,9)-(6,66)
(6,24)-(6,65)
(6,32)-(6,39)
(6,32)-(6,33)
(6,34)-(6,39)
(6,43)-(6,65)
(6,44)-(6,61)
(6,45)-(6,46)
(6,48)-(6,60)
(6,49)-(6,50)
(6,54)-(6,59)
(6,63)-(6,64)
*)
