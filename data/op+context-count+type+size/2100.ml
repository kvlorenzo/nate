
let rec digitsOfInt n =
  if n > 10 then [digitsOfInt (n / 10); n mod 10] else n;;


(* fix

let rec digitsOfInt n = if n >= 100 then [n mod 10] else [n];;

*)

(* changed spans
(3,6)-(3,12)
(3,10)-(3,12)
(3,18)-(3,50)
(3,19)-(3,30)
(3,19)-(3,38)
(3,32)-(3,33)
(3,32)-(3,38)
(3,41)-(3,49)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,6)-(3,7)
(3,6)-(3,12)
(3,10)-(3,12)
(3,18)-(3,50)
(3,19)-(3,30)
(3,19)-(3,38)
(3,32)-(3,38)
(3,56)-(3,57)
*)