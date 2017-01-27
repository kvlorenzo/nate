
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec additivePersistence n =
  match n with | [] -> [] | h::t -> t + (digitsOfInt (additivePersistence h));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(5,29)-(6,76)
(6,9)-(6,10)
(6,24)-(6,26)
(6,37)-(6,38)
(6,37)-(6,76)
(6,42)-(6,53)
(6,42)-(6,76)
(6,55)-(6,74)
(6,55)-(6,76)
*)

(* type error slice
(3,18)-(3,29)
(3,18)-(3,37)
(3,31)-(3,37)
(5,4)-(6,80)
(5,29)-(6,76)
(6,3)-(6,76)
(6,9)-(6,10)
(6,24)-(6,26)
(6,37)-(6,38)
(6,37)-(6,76)
(6,42)-(6,53)
(6,42)-(6,76)
(6,55)-(6,74)
(6,55)-(6,76)
(6,75)-(6,76)
*)