
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(5,51)-(5,56)
*)

(* type error slice
(2,4)-(5,59)
(2,16)-(5,56)
(3,3)-(5,56)
(3,9)-(3,10)
(4,11)-(4,12)
(5,13)-(5,56)
(5,44)-(5,49)
(5,44)-(5,56)
(5,51)-(5,52)
(5,51)-(5,56)
(5,53)-(5,54)
(5,55)-(5,56)
*)