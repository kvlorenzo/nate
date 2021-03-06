
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append [listReverse t; h];;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append t [h];;

*)

(* changed spans
(6,36)-(6,61)
append t [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

(6,43)-(6,61)
EMPTY
EmptyG

(6,44)-(6,55)
EMPTY
EmptyG

(6,44)-(6,57)
EMPTY
EmptyG

(6,59)-(6,60)
[h]
ListG VarG Nothing

*)
