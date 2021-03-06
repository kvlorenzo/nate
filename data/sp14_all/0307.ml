
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,36)-(5,60)
append [h] [h]
AppG (fromList [ListG EmptyG Nothing])

(5,43)-(5,54)
EMPTY
EmptyG

(5,55)-(5,56)
EMPTY
EmptyG

*)
