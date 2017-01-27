
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(12,8)-(12,60)
*)

(* type error slice
(2,4)-(6,19)
(2,15)-(6,17)
(2,17)-(6,17)
(3,3)-(6,17)
(3,15)-(3,17)
(4,3)-(6,17)
(5,30)-(5,36)
(5,30)-(5,56)
(5,38)-(5,48)
(5,51)-(5,56)
(6,3)-(6,9)
(6,3)-(6,17)
(6,10)-(6,15)
(6,16)-(6,17)
(9,17)-(9,28)
(9,17)-(9,31)
(9,29)-(9,31)
(9,35)-(9,46)
(9,35)-(9,49)
(9,47)-(9,49)
(12,8)-(12,60)
(12,23)-(12,25)
(12,23)-(12,60)
(12,28)-(12,39)
(12,28)-(12,60)
(12,41)-(12,46)
(12,41)-(12,55)
(12,47)-(12,48)
(12,50)-(12,55)
(12,58)-(12,60)
*)