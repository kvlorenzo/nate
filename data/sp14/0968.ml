
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (l2 - l1)) l1), l2)
  else (l1, (List.append (clone 0 (l1 - l2) l2)));;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if l1 < l2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

*)

(* changed spans
(11,31)-(11,33)
(11,36)-(11,38)
(11,41)-(11,43)
(12,12)-(12,48)
(12,25)-(12,47)
(12,35)-(12,37)
(12,40)-(12,42)
(12,44)-(12,46)
*)

(* type error slice
(2,3)-(5,12)
(2,14)-(5,10)
(2,16)-(5,10)
(3,2)-(5,10)
(4,4)-(4,61)
(4,19)-(4,22)
(4,28)-(4,31)
(4,28)-(4,61)
(4,32)-(4,53)
(4,33)-(4,44)
(4,49)-(4,52)
(5,2)-(5,5)
(5,2)-(5,10)
(8,13)-(8,24)
(8,13)-(8,27)
(8,25)-(8,27)
(9,13)-(9,24)
(9,13)-(9,27)
(9,25)-(9,27)
(10,2)-(12,49)
(10,5)-(10,7)
(10,5)-(10,12)
(10,10)-(10,12)
(11,7)-(11,49)
(11,8)-(11,44)
(11,9)-(11,20)
(11,30)-(11,39)
(11,31)-(11,33)
(11,36)-(11,38)
(11,41)-(11,43)
(11,46)-(11,48)
(12,7)-(12,49)
(12,8)-(12,10)
(12,12)-(12,48)
(12,13)-(12,24)
(12,25)-(12,47)
(12,26)-(12,31)
(12,34)-(12,43)
(12,35)-(12,37)
(12,40)-(12,42)
*)

(* all spans
(2,14)-(5,10)
(2,16)-(5,10)
(3,2)-(5,10)
(3,14)-(4,61)
(3,18)-(4,61)
(4,4)-(4,61)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,61)
(4,28)-(4,31)
(4,32)-(4,53)
(4,33)-(4,44)
(4,45)-(4,48)
(4,46)-(4,47)
(4,49)-(4,52)
(4,54)-(4,61)
(4,55)-(4,56)
(4,59)-(4,60)
(5,2)-(5,10)
(5,2)-(5,5)
(5,6)-(5,8)
(5,9)-(5,10)
(7,12)-(12,49)
(7,15)-(12,49)
(8,2)-(12,49)
(8,13)-(8,27)
(8,13)-(8,24)
(8,25)-(8,27)
(9,2)-(12,49)
(9,13)-(9,27)
(9,13)-(9,24)
(9,25)-(9,27)
(10,2)-(12,49)
(10,5)-(10,12)
(10,5)-(10,7)
(10,10)-(10,12)
(11,7)-(11,49)
(11,8)-(11,44)
(11,9)-(11,20)
(11,21)-(11,40)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,39)
(11,31)-(11,33)
(11,36)-(11,38)
(11,41)-(11,43)
(11,46)-(11,48)
(12,7)-(12,49)
(12,8)-(12,10)
(12,12)-(12,48)
(12,13)-(12,24)
(12,25)-(12,47)
(12,26)-(12,31)
(12,32)-(12,33)
(12,34)-(12,43)
(12,35)-(12,37)
(12,40)-(12,42)
(12,44)-(12,46)
*)
