
let rec listReverse l = match l with | [] -> [] | h::t -> [t; listReverse h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,59)-(2,77)
(2,60)-(2,61)
(2,63)-(2,76)
(2,75)-(2,76)
*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,31)-(2,32)
(2,46)-(2,48)
(2,63)-(2,74)
(2,63)-(2,76)
(2,75)-(2,76)
*)
