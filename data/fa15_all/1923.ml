
let rec digitsOfInt n = if n < 0 then [] else n mod 10; (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(2,38)-(2,40)
EMPTY
EmptyG

(2,46)-(2,47)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(2,46)-(2,54)
print_int 0
AppG (fromList [LitG])

(2,56)-(2,76)
EMPTY
EmptyG

(2,69)-(2,70)
n / 10
BopG VarG LitG

*)
