
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,38)-(2,60)
(2,52)-(2,53)
*)

(* type error slice
(2,3)-(2,62)
(2,20)-(2,60)
(2,24)-(2,60)
(2,24)-(2,60)
(2,38)-(2,60)
(2,38)-(2,60)
(2,39)-(2,54)
(2,40)-(2,51)
*)

(* all spans
(2,20)-(2,60)
(2,24)-(2,60)
(2,24)-(2,34)
(2,25)-(2,26)
(2,31)-(2,33)
(2,38)-(2,60)
(2,39)-(2,54)
(2,40)-(2,51)
(2,52)-(2,53)
(2,57)-(2,59)
*)
