
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then clone 0 (((-1) * diff) - 1)
  else if diff > 0 then clone 0 diff else (l1, l2);;


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
(10,7)-(10,12)
clone 0 diff
AppG (fromList [VarG,LitG])

(10,7)-(10,34)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,15)-(10,34)
EMPTY
EmptyG

(10,16)-(10,29)
EMPTY
EmptyG

(10,17)-(10,21)
EMPTY
EmptyG

(10,32)-(10,33)
l2
VarG

(11,24)-(11,29)
clone 0 diff
AppG (fromList [VarG,LitG])

(11,24)-(11,36)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
