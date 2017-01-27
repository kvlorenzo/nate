
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
(10,37)-(10,77)
*)

(* type error slice
(2,4)-(4,18)
(2,15)-(4,16)
(2,17)-(4,16)
(3,3)-(4,16)
(3,42)-(3,48)
(3,42)-(3,68)
(3,49)-(3,50)
(3,52)-(3,57)
(3,60)-(3,68)
(4,3)-(4,9)
(4,3)-(4,16)
(4,10)-(4,11)
(4,12)-(4,13)
(4,14)-(4,16)
(7,16)-(7,27)
(7,16)-(7,30)
(7,28)-(7,30)
(8,16)-(8,27)
(8,16)-(8,30)
(8,28)-(8,30)
(9,3)-(10,77)
(9,16)-(9,31)
(10,3)-(10,77)
(10,19)-(10,24)
(10,19)-(10,33)
(10,25)-(10,26)
(10,27)-(10,33)
(10,37)-(10,77)
(10,58)-(10,67)
(10,58)-(10,72)
(10,58)-(10,77)
(10,68)-(10,69)
(10,70)-(10,72)
(10,75)-(10,77)
*)