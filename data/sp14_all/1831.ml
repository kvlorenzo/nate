
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse append (t [h]);;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,49)-(5,75)
listReverse (append t [h])
AppG (fromList [AppG (fromList [EmptyG])])

(5,61)-(5,67)
append t [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

(5,68)-(5,75)
EMPTY
EmptyG

*)
