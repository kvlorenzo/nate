
let rec sumList xs =
  match xs with | [] -> 0 | x::[] -> x | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(3,2)-(3,70)
match xs with
| [] -> 0
| x :: y -> x + sumList y
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

(3,37)-(3,38)
EMPTY
EmptyG

*)
