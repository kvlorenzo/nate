
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: ((digitsOfInt n) / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,33)-(3,52)
(3,45)-(3,46)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,18)-(3,26)
(3,18)-(3,52)
(3,33)-(3,44)
(3,33)-(3,46)
(3,33)-(3,52)
(3,45)-(3,46)
*)
