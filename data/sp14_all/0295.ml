
let rec listReverse l =
  match l with | [] -> [l] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(3,2)-(3,57)
EMPTY
EmptyG

(3,8)-(3,9)
EMPTY
EmptyG

(3,23)-(3,26)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

*)
