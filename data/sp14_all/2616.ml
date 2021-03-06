
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  let to_append = clone 0 l_diff in if l_diff < 0 then ((to_append @ l1), l2);;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  let to_append = clone 0 l_diff in
  if l_diff < 0 then ((to_append @ l1), l2) else (l1, (to_append @ l2));;

*)

(* changed spans
(10,36)-(10,77)
(l1 , to_append @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
