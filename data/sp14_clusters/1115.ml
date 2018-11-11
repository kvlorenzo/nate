
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,2)-(3,58)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]

(3,40)-(3,58)
h :: (listReverse [])
ConAppG (Just (TupleG [VarG,AppG [ListG EmptyG Nothing]])) Nothing

(3,56)-(3,57)
[]
ListG EmptyG Nothing

*)
