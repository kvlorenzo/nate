
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l1 @ (clone 0 (((-1) * diff) - 1) (l1, l2))
  else if diff > 0 then l2 @ (clone 0 diff (l1, l2)) else (l1, l2);;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(10,7)-(10,50)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,12)-(10,50)
clone 0 diff
AppG (fromList [VarG,LitG])

(10,21)-(10,40)
EMPTY
EmptyG

(10,22)-(10,35)
EMPTY
EmptyG

(10,23)-(10,27)
EMPTY
EmptyG

(10,38)-(10,39)
EMPTY
EmptyG

(10,41)-(10,49)
EMPTY
EmptyG

(10,42)-(10,44)
EMPTY
EmptyG

(11,24)-(11,52)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,29)-(11,52)
clone 0 diff
AppG (fromList [VarG,LitG])

(11,58)-(11,66)
EMPTY
EmptyG

(11,59)-(11,61)
EMPTY
EmptyG

(11,63)-(11,65)
EMPTY
EmptyG

*)
