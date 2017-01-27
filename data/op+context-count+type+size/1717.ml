
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([(List.hd x) + 1], [(List.hd x) + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,20)-(19,27)
(19,20)-(19,29)
(19,39)-(19,46)
(19,39)-(19,48)
(20,17)-(20,19)
(20,21)-(20,23)
*)

(* type error slice
(2,4)-(4,18)
(2,15)-(4,16)
(2,17)-(4,16)
(3,3)-(4,16)
(3,42)-(3,48)
(3,42)-(3,68)
(3,49)-(3,50)
(3,52)-(3,57)
(3,60)-(3,68)
(4,3)-(4,9)
(4,3)-(4,16)
(4,10)-(4,11)
(4,12)-(4,13)
(4,14)-(4,16)
(6,4)-(12,39)
(6,13)-(12,35)
(6,16)-(12,35)
(7,3)-(12,35)
(7,16)-(7,27)
(7,16)-(7,30)
(7,28)-(7,30)
(8,3)-(12,35)
(8,16)-(8,27)
(8,16)-(8,30)
(8,28)-(8,30)
(9,3)-(12,35)
(10,3)-(12,35)
(11,11)-(11,16)
(11,11)-(11,32)
(11,11)-(11,40)
(11,11)-(11,45)
(11,17)-(11,18)
(11,20)-(11,32)
(11,36)-(11,37)
(11,38)-(11,40)
(11,43)-(11,45)
(18,3)-(22,33)
(18,12)-(21,71)
(19,5)-(21,71)
(19,11)-(19,54)
(19,13)-(19,54)
(19,18)-(19,35)
(19,18)-(19,54)
(19,20)-(19,27)
(19,20)-(19,29)
(19,20)-(19,34)
(19,28)-(19,29)
(19,37)-(19,54)
(19,39)-(19,53)
(20,5)-(21,71)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(21,5)-(21,71)
(21,16)-(21,18)
(21,22)-(21,71)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,55)-(21,59)
(21,60)-(21,64)
(21,68)-(21,71)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)
