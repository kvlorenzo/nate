
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,13)-(3,14)
0
LitG

(3,39)-(3,49)
EMPTY
EmptyG

(3,45)-(3,48)
EMPTY
EmptyG

*)