
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 @ [(clone 0 ((List.length l1) - (List.length l2))) @ l2]
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ l2)
    else [];;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,66)
EMPTY
EmptyG

(6,10)-(6,11)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,12)-(6,66)
EMPTY
EmptyG

(9,9)-(9,68)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,59)-(9,68)
EMPTY
EmptyG

(9,63)-(9,64)
EMPTY
EmptyG

(10,9)-(10,11)
(l1 , l2)
TupleG (fromList [VarG])

*)
