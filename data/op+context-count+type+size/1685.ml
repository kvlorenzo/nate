
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,14)-(3,15)
(3,41)-(3,49)
(3,46)-(3,49)
*)

(* type error slice
(2,4)-(3,68)
(2,15)-(3,66)
(2,17)-(3,66)
(3,3)-(3,66)
(3,20)-(3,66)
(3,23)-(3,24)
(3,23)-(3,28)
(3,27)-(3,28)
(3,34)-(3,39)
(3,34)-(3,57)
(3,41)-(3,49)
(3,52)-(3,57)
*)