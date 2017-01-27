
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append ((clone 0 (- diff)), len1)), len2)
  else ((List.append ((clone 0 diff), len2)), len1);;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else ((List.append (clone 0 diff) l2), l1);;

*)

(* changed spans
(12,10)-(12,47)
(12,24)-(12,47)
(12,43)-(12,47)
(12,51)-(12,55)
(13,10)-(13,43)
(13,10)-(13,51)
(13,24)-(13,43)
(13,39)-(13,43)
(13,47)-(13,51)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,29)-(4,37)
(4,29)-(4,55)
(4,39)-(4,47)
(4,50)-(4,55)
(5,3)-(5,11)
(5,3)-(5,16)
(5,12)-(5,14)
(5,15)-(5,16)
(8,3)-(13,51)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,3)-(13,51)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(10,3)-(13,51)
(10,14)-(10,25)
(12,10)-(12,21)
(12,10)-(12,47)
(12,24)-(12,29)
(12,24)-(12,39)
(12,24)-(12,47)
(12,30)-(12,31)
(12,43)-(12,47)
(13,10)-(13,21)
(13,10)-(13,43)
(13,24)-(13,29)
(13,24)-(13,36)
(13,24)-(13,43)
(13,30)-(13,31)
(13,32)-(13,36)
(13,39)-(13,43)
*)