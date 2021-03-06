
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat l h) :: t;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,58)-(4,67)
listReverse
VarG

(4,58)-(4,72)
listReverse (cat l h)
AppG (fromList [AppG (fromList [EmptyG])])

(4,71)-(4,72)
EMPTY
EmptyG

*)
