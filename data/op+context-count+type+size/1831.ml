
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(3,3)-(3,57)
(3,38)-(3,57)
(3,56)-(3,57)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,9)-(3,10)
(3,24)-(3,26)
(3,38)-(3,49)
(3,38)-(3,51)
(3,50)-(3,51)
*)