
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,41)-(3,58)
EMPTY
EmptyG

(3,42)-(3,43)
listReverse t
AppG (fromList [VarG])

*)
