
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, (clone (l1, l2)))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l2) in
       List.append ((clone (l1 l2G)), l2))
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(8,5)-(8,16)
(8,5)-(8,36)
(8,23)-(8,28)
(8,23)-(8,36)
(8,30)-(8,32)
(8,30)-(8,36)
(8,34)-(8,36)
(12,50)-(12,52)
(13,8)-(13,19)
(13,8)-(13,41)
(13,22)-(13,27)
(13,22)-(13,35)
(13,29)-(13,31)
(13,29)-(13,35)
(13,39)-(13,41)
*)

(* type error slice
(2,51)-(2,56)
(2,51)-(2,65)
(2,57)-(2,58)
(2,60)-(2,65)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(8,5)-(8,16)
(8,5)-(8,36)
(8,18)-(8,20)
(8,18)-(8,36)
(8,23)-(8,28)
(8,23)-(8,36)
(8,30)-(8,32)
(8,30)-(8,36)
(8,34)-(8,36)
(12,8)-(13,41)
(12,19)-(12,52)
(13,8)-(13,19)
(13,8)-(13,41)
(13,22)-(13,27)
(13,22)-(13,35)
(13,22)-(13,41)
(13,29)-(13,31)
(13,29)-(13,35)
(13,32)-(13,35)
(13,39)-(13,41)
*)