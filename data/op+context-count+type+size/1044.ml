
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) * 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(3,41)-(3,60)
(3,58)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,17)-(3,19)
(3,26)-(3,34)
(3,26)-(3,60)
(3,41)-(3,52)
(3,41)-(3,54)
(3,41)-(3,60)
(3,53)-(3,54)
*)