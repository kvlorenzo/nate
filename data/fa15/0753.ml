
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
*)

(* type error slice
(2,3)-(2,77)
(2,16)-(2,75)
(2,21)-(2,75)
(2,43)-(2,45)
(2,58)-(2,75)
(2,62)-(2,75)
(2,63)-(2,70)
*)

(* all spans
(2,16)-(2,75)
(2,21)-(2,75)
(2,27)-(2,29)
(2,43)-(2,45)
(2,58)-(2,75)
(2,58)-(2,59)
(2,62)-(2,75)
(2,63)-(2,70)
(2,71)-(2,74)
*)
