
let rec clone x n = match n with | 0 -> [] | _ -> [clone x (n - 1); x];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,51)-(2,71)
(2,52)-(2,57)
(2,69)-(2,70)
*)

(* type error slice
(2,4)-(2,73)
(2,15)-(2,71)
(2,17)-(2,71)
(2,21)-(2,71)
(2,41)-(2,43)
(2,52)-(2,57)
(2,52)-(2,66)
(2,58)-(2,59)
(2,61)-(2,62)
(2,61)-(2,66)
*)
