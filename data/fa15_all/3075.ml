
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (digitsOfInt n) else numL;;

*)

(* changed spans
(3,34)-(3,49)
10
LitG

(3,54)-(3,56)
EMPTY
EmptyG

(3,71)-(3,75)
EMPTY
EmptyG

*)
