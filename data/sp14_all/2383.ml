
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) mod 10) :: (n / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,17)-(3,32)
EMPTY
EmptyG

(3,18)-(3,29)
EMPTY
EmptyG

(3,44)-(3,52)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
