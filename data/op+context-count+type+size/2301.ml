
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 < lenl2
  then
    ((List.append (clone 0 (lenl1 - lenl2)) l1),
      (List.append (clone 0 (lenl1 - lenl2)) l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  ((List.append (clone 0 (lenl1 - lenl2)) l1),
    (List.append (clone 0 (lenl1 - lenl2)) l2));;

*)

(* changed spans
(7,3)-(10,48)
(7,6)-(7,11)
(7,6)-(7,19)
(7,14)-(7,19)
(10,46)-(10,48)
*)

(* type error slice
(2,51)-(2,56)
(2,51)-(2,65)
(2,57)-(2,58)
(2,60)-(2,65)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,3)-(10,48)
(9,7)-(9,18)
(9,7)-(9,47)
(9,7)-(10,48)
(9,20)-(9,25)
(9,20)-(9,42)
(9,26)-(9,27)
(9,29)-(9,42)
(9,45)-(9,47)
(10,8)-(10,19)
(10,8)-(10,48)
(10,21)-(10,26)
(10,21)-(10,43)
(10,27)-(10,28)
(10,30)-(10,43)
(10,46)-(10,48)
*)