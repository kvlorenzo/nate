
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2 then (((clone 0 (len1 - len2)) @ len2), len1);;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (((clone 0 (len1 - len2)) @ l2), l1)
  else (((clone 0 (len2 - len1)) @ l1), l2);;

*)

(* changed spans
(10,3)-(10,62)
(10,51)-(10,55)
(10,58)-(10,62)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
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
(8,3)-(10,62)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,3)-(10,62)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(10,3)-(10,62)
(10,26)-(10,31)
(10,26)-(10,46)
(10,26)-(10,55)
(10,26)-(10,62)
(10,32)-(10,33)
(10,35)-(10,46)
(10,49)-(10,50)
(10,51)-(10,55)
(10,58)-(10,62)
*)
