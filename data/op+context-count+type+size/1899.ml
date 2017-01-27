
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (digitsOfInt (n mod 10)));;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (n / 10) :: (digitsOfInt (n mod 10)));;

*)

(* changed spans
(8,20)-(8,31)
(8,20)-(8,39)
*)

(* type error slice
(2,4)-(8,72)
(2,21)-(8,67)
(3,3)-(8,67)
(3,9)-(3,10)
(3,9)-(3,14)
(3,13)-(3,14)
(4,15)-(4,17)
(8,20)-(8,31)
(8,20)-(8,39)
(8,20)-(8,67)
(8,33)-(8,39)
(8,46)-(8,57)
(8,46)-(8,67)
(8,59)-(8,67)
*)