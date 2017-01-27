
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, b);;

let fixpoint (f,b) =
  let y = f b in
  match y with | aPrime -> if b = aPrime then b else fixpoint (f, aPrime);;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' b = ((f b), (b != (f b))) in wwhile (f', b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(5,33)-(5,34)
(7,15)-(9,73)
(8,11)-(8,14)
(9,3)-(9,73)
(9,9)-(9,10)
(9,28)-(9,73)
(9,31)-(9,41)
(9,35)-(9,41)
(9,47)-(9,48)
*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,14)
(3,13)-(3,14)
(3,55)-(3,61)
(3,55)-(3,68)
(3,63)-(3,64)
(3,63)-(3,68)
(3,66)-(3,68)
(5,4)-(5,37)
(5,15)-(5,34)
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(5,33)-(5,34)
(8,3)-(9,73)
(8,11)-(8,12)
(8,11)-(8,14)
(8,13)-(8,14)
(9,3)-(9,73)
(9,9)-(9,10)
(9,54)-(9,62)
(9,54)-(9,73)
(9,64)-(9,65)
(9,64)-(9,73)
(9,67)-(9,73)
*)