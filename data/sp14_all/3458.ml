
let rec digitsOfInt n = if n <= 0 then [] else [n mod (10 n)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,48)-(2,60)
EMPTY
EmptyG

(2,54)-(2,60)
EMPTY
EmptyG

(2,55)-(2,57)
EMPTY
EmptyG

(2,58)-(2,59)
EMPTY
EmptyG

*)
