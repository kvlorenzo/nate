
let rec listReverse l = match l with | [] -> 0 | h::t -> h @ [];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,45)-(2,46)
[]
ListG EmptyG Nothing

(2,57)-(2,58)
[h]
ListG VarG Nothing

(2,61)-(2,63)
EMPTY
EmptyG

*)
