
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,2)-(4,73)
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG (fromList [AppG (fromList [VarG]),AppG (fromList [AppG (fromList [VarG])])]))) Nothing)])

(4,34)-(4,45)
listReverse (List.tl l)
AppG (fromList [AppG (fromList [EmptyG])])

(4,62)-(4,73)
EMPTY
EmptyG

(4,63)-(4,70)
EMPTY
EmptyG

(4,71)-(4,72)
EMPTY
EmptyG

*)
