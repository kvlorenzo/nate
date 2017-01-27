
let rec clone x n =
  match n > 0 with | true  -> x @ ((clone x n) - 1) | false  -> x @ [];;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,9)-(3,14)
(3,31)-(3,32)
(3,31)-(3,51)
(3,33)-(3,34)
(3,37)-(3,51)
(3,45)-(3,46)
(3,65)-(3,71)
*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,9)-(3,10)
(3,9)-(3,14)
(3,13)-(3,14)
(3,31)-(3,32)
(3,31)-(3,51)
(3,33)-(3,34)
(3,37)-(3,42)
(3,37)-(3,46)
(3,37)-(3,51)
(3,43)-(3,44)
(3,45)-(3,46)
*)
