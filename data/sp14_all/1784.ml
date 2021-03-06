
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then List.append l1 ((clone 0 (first - sec)) :: l2)
    else (l1, l2);;


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
(11,9)-(11,55)
(l1 , List.append (clone 0
                         (first - sec)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,21)-(11,23)
EMPTY
EmptyG

(11,24)-(11,55)
EMPTY
EmptyG

*)
