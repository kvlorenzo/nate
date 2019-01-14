
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) :: l1
  else (clone "0" ((List.length l1) - (List.length l2))) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,60)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,8)-(6,13)
(@)
VarG

(6,8)-(6,13)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,7)-(7,56)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,7)-(7,62)
l2
VarG

(7,8)-(7,13)
(@)
VarG

(7,8)-(7,13)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,14)-(7,17)
0
LitG

*)
