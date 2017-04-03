
let rec clone x n =
  match n > 0 with | true  -> x :: ((clone x n) - 1) | false  -> x;;


(* fix

let rec clone x n =
  match n = 0 with | true  -> [] | false  -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,8)-(3,13)
(3,30)-(3,52)
(3,35)-(3,52)
(3,45)-(3,46)
(3,65)-(3,66)
*)

(* type error slice
(3,2)-(3,66)
(3,2)-(3,66)
(3,30)-(3,31)
(3,30)-(3,52)
(3,30)-(3,52)
(3,30)-(3,52)
(3,35)-(3,52)
(3,65)-(3,66)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(3,30)-(3,52)
(3,30)-(3,31)
(3,35)-(3,52)
(3,36)-(3,47)
(3,37)-(3,42)
(3,43)-(3,44)
(3,45)-(3,46)
(3,50)-(3,51)
(3,65)-(3,66)
*)
