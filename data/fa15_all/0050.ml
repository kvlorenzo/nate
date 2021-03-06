
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, (((clone 0 ll1) - ll2) @ l2))
  else (((clone ((0 ll2) - ll1)) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

*)

(* changed spans
(8,13)-(8,34)
EMPTY
EmptyG

(8,23)-(8,26)
ll1 - ll2
BopG VarG VarG

(9,9)-(9,32)
clone 0 (ll2 - ll1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,16)-(9,31)
EMPTY
EmptyG

(9,17)-(9,24)
EMPTY
EmptyG

(9,20)-(9,23)
ll2 - ll1
BopG VarG VarG

*)
