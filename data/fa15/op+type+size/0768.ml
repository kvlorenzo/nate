
let rec clone x n = if n = 0 then [] else x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,66)
(2,54)-(2,65)
(2,55)-(2,60)
(2,58)-(2,59)
*)

(* type error slice
(2,3)-(2,68)
(2,14)-(2,66)
(2,47)-(2,66)
(2,48)-(2,53)
(2,54)-(2,65)
(2,55)-(2,60)
(2,56)-(2,57)
*)

(* all spans
(2,14)-(2,66)
(2,16)-(2,66)
(2,20)-(2,66)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,66)
(2,42)-(2,43)
(2,47)-(2,66)
(2,48)-(2,53)
(2,54)-(2,65)
(2,55)-(2,60)
(2,56)-(2,57)
(2,58)-(2,59)
(2,63)-(2,64)
*)
