
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,56)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,25)-(3,45)
(@)
VarG

(3,47)-(3,55)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
