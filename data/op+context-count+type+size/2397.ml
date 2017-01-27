
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l2) <
      ((List.length l1) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


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
(10,5)-(10,16)
(10,5)-(10,76)
(10,17)-(10,71)
(10,72)-(10,76)
(12,6)-(12,20)
(12,6)-(14,64)
(12,18)-(12,20)
(13,9)-(14,64)
(13,21)-(13,23)
(13,25)-(13,36)
(13,37)-(13,41)
(13,38)-(13,40)
(14,10)-(14,64)
(14,12)-(14,63)
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
(8,3)-(14,64)
(8,7)-(8,18)
(8,7)-(8,21)
(8,19)-(8,21)
(8,26)-(8,37)
(8,26)-(8,40)
(8,38)-(8,40)
(10,5)-(10,16)
(10,5)-(10,76)
(10,17)-(10,71)
(10,19)-(10,24)
(10,19)-(10,62)
(10,19)-(10,70)
(10,25)-(10,26)
(10,29)-(10,62)
(10,66)-(10,67)
(10,68)-(10,70)
(10,72)-(10,76)
(10,73)-(10,75)
(12,6)-(14,64)
(13,9)-(13,20)
(13,9)-(13,23)
(13,9)-(14,64)
(13,21)-(13,23)
(13,25)-(13,36)
(13,37)-(13,41)
(13,38)-(13,40)
(14,10)-(14,64)
(14,12)-(14,17)
(14,12)-(14,55)
(14,12)-(14,63)
(14,18)-(14,19)
(14,22)-(14,55)
(14,59)-(14,60)
(14,61)-(14,63)
*)