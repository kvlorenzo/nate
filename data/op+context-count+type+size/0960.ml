
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.combine ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.combine ((clone 0 diff), l2)));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,10)-(10,22)
(10,10)-(10,48)
(10,25)-(10,30)
(10,25)-(10,48)
(11,8)-(11,63)
(11,31)-(11,43)
(11,31)-(11,63)
(11,46)-(11,51)
(11,46)-(11,63)
*)

(* type error slice
(2,4)-(5,23)
(2,15)-(5,21)
(2,17)-(5,21)
(3,3)-(5,21)
(4,28)-(4,39)
(4,28)-(4,59)
(4,40)-(4,41)
(4,43)-(4,48)
(4,51)-(4,59)
(5,3)-(5,14)
(5,3)-(5,21)
(5,15)-(5,16)
(5,17)-(5,18)
(5,19)-(5,21)
(8,3)-(11,63)
(8,15)-(8,26)
(8,15)-(8,29)
(8,15)-(8,48)
(8,27)-(8,29)
(8,34)-(8,45)
(8,34)-(8,48)
(8,46)-(8,48)
(10,10)-(10,22)
(10,10)-(10,48)
(10,25)-(10,30)
(10,25)-(10,42)
(10,25)-(10,48)
(10,31)-(10,32)
(10,34)-(10,37)
(10,34)-(10,42)
(10,38)-(10,42)
(10,46)-(10,48)
(11,8)-(11,63)
(11,26)-(11,28)
(11,26)-(11,63)
(11,31)-(11,43)
(11,31)-(11,63)
(11,46)-(11,51)
(11,46)-(11,58)
(11,46)-(11,63)
(11,52)-(11,53)
(11,54)-(11,58)
(11,61)-(11,63)
*)