
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then List.append ((clone 0 (abs diff)) l1)
  else if diff > 0 then List.append ((clone 0 diff) l2);;


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
(10,7)-(10,18)
List.append (clone 0
                   (abs diff)) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(10,7)-(10,44)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,19)-(10,44)
EMPTY
EmptyG

(11,7)-(11,55)
(l1 , l2)
TupleG (fromList [VarG])

(11,24)-(11,35)
List.append (clone 0 diff) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,24)-(11,55)
(l1 , List.append (clone 0
                         diff) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,36)-(11,55)
EMPTY
EmptyG

*)
