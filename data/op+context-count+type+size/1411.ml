
let rec digitsOfInt n = match n with | [] -> [] | h::t -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,25)-(2,75)
(2,59)-(2,75)
*)

(* type error slice
(2,25)-(2,75)
(2,31)-(2,32)
(2,59)-(2,75)
(2,73)-(2,75)
*)
