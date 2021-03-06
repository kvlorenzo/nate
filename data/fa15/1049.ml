
let rec clone x n = match n with | 0 -> [] | _ -> [x; clone x (n - 1)];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,50)-(2,70)
*)

(* type error slice
(2,3)-(2,72)
(2,14)-(2,70)
(2,16)-(2,70)
(2,20)-(2,70)
(2,50)-(2,70)
(2,54)-(2,59)
(2,54)-(2,69)
*)

(* all spans
(2,14)-(2,70)
(2,16)-(2,70)
(2,20)-(2,70)
(2,26)-(2,27)
(2,40)-(2,42)
(2,50)-(2,70)
(2,51)-(2,52)
(2,54)-(2,69)
(2,54)-(2,59)
(2,60)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,67)-(2,68)
*)
