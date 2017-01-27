
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, (((clone 0 s1) - s2) @ l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(9,32)-(9,48)
(9,40)-(9,42)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,3)-(9,69)
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(9,32)-(9,37)
(9,32)-(9,42)
(9,32)-(9,48)
(9,32)-(9,54)
(9,38)-(9,39)
(9,40)-(9,42)
(9,50)-(9,51)
(9,52)-(9,54)
*)
