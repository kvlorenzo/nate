
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,60)-(2,67)
*)

(* type error slice
(2,4)-(2,69)
(2,17)-(2,67)
(2,22)-(2,67)
(2,28)-(2,30)
(2,44)-(2,45)
(2,56)-(2,67)
(2,60)-(2,67)
*)