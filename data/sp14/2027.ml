
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,50)-(3,69)
(3,57)-(3,68)
(3,58)-(3,63)
(3,61)-(3,62)
*)

(* type error slice
(2,3)-(3,71)
(2,14)-(3,69)
(3,50)-(3,69)
(3,51)-(3,56)
(3,57)-(3,68)
(3,58)-(3,63)
(3,59)-(3,60)
*)

(* all spans
(2,14)-(3,69)
(2,16)-(3,69)
(3,2)-(3,69)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(3,31)-(3,33)
(3,45)-(3,69)
(3,45)-(3,46)
(3,50)-(3,69)
(3,51)-(3,56)
(3,57)-(3,68)
(3,58)-(3,63)
(3,59)-(3,60)
(3,61)-(3,62)
(3,66)-(3,67)
*)
