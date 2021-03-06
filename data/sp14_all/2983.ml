
let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n =
  if n >= 10 then app (digitsOfInt (n / 10) [n mod 10]) else app [n] [8];;


(* fix

let rec app l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (app t l2);;

let rec digitsOfInt n = if n >= 10 then app [5] [n mod 10] else app [3] [8];;

*)

(* changed spans
(5,18)-(5,21)
EMPTY
EmptyG

(5,18)-(5,55)
EMPTY
EmptyG

(5,23)-(5,34)
EMPTY
EmptyG

(5,35)-(5,43)
EMPTY
EmptyG

(5,36)-(5,37)
EMPTY
EmptyG

(5,40)-(5,42)
app
VarG

(5,45)-(5,53)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(5,66)-(5,67)
3
LitG

*)
