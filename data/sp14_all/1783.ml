
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then (clone 0 (sec - first)) :: l1
  else
    if first > sec then (l1, ((clone 0 (first - sec)) :: l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

*)

(* changed spans
(8,7)-(8,36)
(List.append (clone 0
                    (sec - first)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,8)-(8,13)
clone 0 (sec - first)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(10,4)-(10,75)
l2
VarG

(10,29)-(10,60)
EMPTY
EmptyG

(10,31)-(10,36)
clone 0 (first - sec)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)
