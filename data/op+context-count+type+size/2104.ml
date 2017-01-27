
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else [n];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,19)-(5,22)
(5,19)-(5,55)
(5,24)-(5,35)
(5,37)-(5,38)
(5,37)-(5,43)
(5,41)-(5,43)
(5,46)-(5,54)
(5,62)-(5,65)
(5,63)-(5,64)
*)

(* type error slice
(2,21)-(2,70)
(2,62)-(2,65)
(2,62)-(2,70)
(2,66)-(2,67)
(2,68)-(2,70)
(5,3)-(5,65)
(5,6)-(5,7)
(5,6)-(5,13)
(5,11)-(5,13)
(5,19)-(5,22)
(5,19)-(5,55)
(5,62)-(5,65)
(5,63)-(5,64)
*)
