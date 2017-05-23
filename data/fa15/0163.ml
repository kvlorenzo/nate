
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (fun x  -> ((x, ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,28)-(5,61)
(5,40)-(5,56)
*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(5,21)-(5,27)
(5,21)-(5,61)
(5,28)-(5,61)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,33)-(3,34)
(3,50)-(3,63)
(3,50)-(3,56)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(5,14)-(5,61)
(5,21)-(5,61)
(5,21)-(5,27)
(5,28)-(5,61)
(5,39)-(5,60)
(5,40)-(5,56)
(5,41)-(5,42)
(5,44)-(5,55)
(5,45)-(5,50)
(5,46)-(5,47)
(5,48)-(5,49)
(5,53)-(5,54)
(5,58)-(5,59)
*)