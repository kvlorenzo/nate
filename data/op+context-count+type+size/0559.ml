
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> l1 :: ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
  | false  -> ((clone 0 ((List.length l2) - (List.length l1))) @ [l1]) :: l2;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(11,14)-(11,73)
(12,17)-(12,77)
(12,66)-(12,70)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,24)-(6,35)
(6,24)-(6,46)
(6,36)-(6,38)
(6,40)-(6,46)
(7,3)-(7,14)
(7,3)-(7,23)
(7,15)-(7,16)
(7,18)-(7,21)
(7,18)-(7,23)
(7,22)-(7,23)
(10,3)-(12,77)
(10,10)-(10,21)
(10,10)-(10,24)
(10,22)-(10,24)
(10,29)-(10,40)
(10,29)-(10,43)
(10,41)-(10,43)
(11,14)-(11,16)
(11,14)-(11,73)
(11,22)-(11,27)
(11,22)-(11,65)
(11,22)-(11,73)
(11,28)-(11,29)
(11,32)-(11,65)
(11,69)-(11,70)
(11,71)-(11,73)
(12,17)-(12,22)
(12,17)-(12,60)
(12,17)-(12,70)
(12,17)-(12,77)
(12,23)-(12,24)
(12,27)-(12,60)
(12,64)-(12,65)
(12,66)-(12,70)
(12,67)-(12,69)
*)
