
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else ([l1], ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,9)-(10,13)
*)

(* type error slice
(2,4)-(5,18)
(2,11)-(5,16)
(2,13)-(5,16)
(3,3)-(5,16)
(4,29)-(4,35)
(4,29)-(4,55)
(4,36)-(4,37)
(4,39)-(4,44)
(4,47)-(4,55)
(5,3)-(5,9)
(5,3)-(5,16)
(5,10)-(5,11)
(5,12)-(5,13)
(5,14)-(5,16)
(8,3)-(10,68)
(8,7)-(8,18)
(8,7)-(8,21)
(8,19)-(8,21)
(8,26)-(8,37)
(8,26)-(8,40)
(8,38)-(8,40)
(9,11)-(9,16)
(9,11)-(9,54)
(9,11)-(9,62)
(9,11)-(9,67)
(9,17)-(9,18)
(9,21)-(9,54)
(9,58)-(9,59)
(9,60)-(9,62)
(9,65)-(9,67)
(10,9)-(10,13)
(10,9)-(10,68)
(10,10)-(10,12)
(10,17)-(10,22)
(10,17)-(10,60)
(10,17)-(10,68)
(10,23)-(10,24)
(10,27)-(10,60)
(10,64)-(10,65)
(10,66)-(10,68)
*)
