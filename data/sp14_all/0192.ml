
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,38)-(3,62)
listReverse (hd :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(3,60)-(3,62)
EMPTY
EmptyG

*)
