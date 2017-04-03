
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, (((clone 0 lenl1) - lenl2) @ l2))
  else ((((clone 0 lenl2) - lenl1) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

*)

(* changed spans
(8,13)-(8,38)
(8,23)-(8,28)
(9,9)-(9,34)
(9,19)-(9,24)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(8,12)-(8,44)
(8,13)-(8,38)
(8,13)-(8,38)
(8,14)-(8,29)
(8,15)-(8,20)
(8,39)-(8,40)
(9,8)-(9,40)
(9,9)-(9,34)
(9,9)-(9,34)
(9,10)-(9,25)
(9,11)-(9,16)
(9,35)-(9,36)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(9,45)
(4,15)-(9,45)
(5,2)-(9,45)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(9,45)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(9,45)
(7,5)-(7,18)
(7,5)-(7,10)
(7,13)-(7,18)
(8,7)-(8,45)
(8,8)-(8,10)
(8,12)-(8,44)
(8,39)-(8,40)
(8,13)-(8,38)
(8,14)-(8,29)
(8,15)-(8,20)
(8,21)-(8,22)
(8,23)-(8,28)
(8,32)-(8,37)
(8,41)-(8,43)
(9,7)-(9,45)
(9,8)-(9,40)
(9,35)-(9,36)
(9,9)-(9,34)
(9,10)-(9,25)
(9,11)-(9,16)
(9,17)-(9,18)
(9,19)-(9,24)
(9,28)-(9,33)
(9,37)-(9,39)
(9,42)-(9,44)
*)
