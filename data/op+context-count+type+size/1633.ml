
let rec digitsOfInt n = if n <= 0 then [] else [n mod (10 n)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n];;

*)

(* changed spans
(2,49)-(2,60)
(2,56)-(2,60)
*)

(* type error slice
(2,28)-(2,29)
(2,28)-(2,34)
(2,33)-(2,34)
(2,56)-(2,58)
(2,56)-(2,60)
(2,59)-(2,60)
*)