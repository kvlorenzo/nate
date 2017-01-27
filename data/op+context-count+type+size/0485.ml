
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let l1 = List.length l1 in
  let l2 = List.length l2 in
  (((clone 0 (l2 - l1)) @ l1), ((clone 0 (l1 - l2)) @ l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

*)

(* changed spans
(8,15)-(8,17)
(8,20)-(8,22)
(8,27)-(8,29)
(8,43)-(8,45)
(8,48)-(8,50)
(8,55)-(8,57)
*)

(* type error slice
(3,53)-(3,58)
(3,53)-(3,67)
(3,59)-(3,60)
(3,62)-(3,67)
(6,3)-(8,57)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(7,3)-(8,57)
(7,12)-(7,23)
(7,12)-(7,26)
(7,24)-(7,26)
(8,6)-(8,11)
(8,6)-(8,22)
(8,6)-(8,29)
(8,12)-(8,13)
(8,15)-(8,22)
(8,25)-(8,26)
(8,27)-(8,29)
(8,34)-(8,39)
(8,34)-(8,50)
(8,34)-(8,57)
(8,40)-(8,41)
(8,43)-(8,50)
(8,53)-(8,54)
(8,55)-(8,57)
*)