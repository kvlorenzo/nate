
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.combine ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.combine ((clone 0 diff), l2)));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,8)-(10,49)
EMPTY
EmptyG

(10,9)-(10,21)
EMPTY
EmptyG

(10,22)-(10,48)
EMPTY
EmptyG

(10,24)-(10,29)
clone 0 (abs diff)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(11,7)-(11,65)
(l1 , l2)
TupleG (fromList [VarG])

(11,29)-(11,64)
EMPTY
EmptyG

(11,30)-(11,42)
EMPTY
EmptyG

(11,43)-(11,63)
EMPTY
EmptyG

(11,45)-(11,50)
clone 0 diff
AppG (fromList [VarG,LitG])

*)
