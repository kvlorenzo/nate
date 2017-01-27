
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then (app digitsOfInt n) / (10 [n mod 10]) else app [3] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10)) [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,20)-(5,55)
(5,24)-(5,35)
(5,36)-(5,37)
(5,42)-(5,55)
*)

(* type error slice
(2,21)-(2,70)
(2,62)-(2,65)
(2,62)-(2,70)
(2,66)-(2,67)
(2,68)-(2,70)
(4,4)-(5,75)
(4,21)-(5,73)
(5,3)-(5,73)
(5,6)-(5,7)
(5,6)-(5,13)
(5,11)-(5,13)
(5,20)-(5,23)
(5,20)-(5,37)
(5,20)-(5,55)
(5,24)-(5,35)
(5,36)-(5,37)
(5,42)-(5,44)
(5,42)-(5,55)
(5,45)-(5,55)
(5,46)-(5,54)
(5,62)-(5,65)
(5,62)-(5,73)
(5,66)-(5,69)
(5,67)-(5,68)
(5,70)-(5,73)
(5,71)-(5,72)
*)