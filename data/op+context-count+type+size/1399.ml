
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [];;

*)

(* changed spans
(3,37)-(3,38)
(3,37)-(3,58)
(3,43)-(3,44)
(3,45)-(3,56)
*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,58)
(3,3)-(3,58)
(3,9)-(3,10)
(3,24)-(3,26)
(3,43)-(3,44)
(3,43)-(3,58)
(3,45)-(3,56)
(3,57)-(3,58)
*)