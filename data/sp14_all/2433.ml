
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then ((0 :: l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,7)-(5,66)
(l1 , l2)
TupleG (fromList [VarG])

(5,52)-(5,61)
EMPTY
EmptyG

(5,53)-(5,54)
EMPTY
EmptyG

*)
