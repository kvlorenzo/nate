
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (c,n) = a in
      let sum = (n1 + n2) + c in
      if sum > 9 then (1, ((sum - 10) :: n)) else (0, (sum :: n)) in
    let base = (0, []) in
    let args = List.combine ((List.rev 0) :: l1) ((List.rev 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (c,n) = a in
      let sum = (n1 + n2) + c in
      if sum > 9 then (1, ((sum - 10) :: n)) else (0, (sum :: n)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,28)-(21,48)
(21,39)-(21,40)
(21,49)-(21,69)
(21,60)-(21,61)
*)

(* type error slice
(21,29)-(21,41)
(21,30)-(21,38)
(21,39)-(21,40)
(21,50)-(21,62)
(21,51)-(21,59)
(21,60)-(21,61)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(8,74)
(4,15)-(8,74)
(5,2)-(8,74)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(8,74)
(6,5)-(6,13)
(6,5)-(6,9)
(6,12)-(6,13)
(7,7)-(7,34)
(7,8)-(7,10)
(7,12)-(7,33)
(7,28)-(7,29)
(7,13)-(7,27)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,26)
(7,30)-(7,32)
(8,7)-(8,74)
(8,10)-(8,18)
(8,10)-(8,14)
(8,17)-(8,18)
(8,24)-(8,60)
(8,25)-(8,55)
(8,50)-(8,51)
(8,26)-(8,49)
(8,27)-(8,32)
(8,33)-(8,34)
(8,35)-(8,48)
(8,36)-(8,40)
(8,43)-(8,47)
(8,52)-(8,54)
(8,57)-(8,59)
(8,66)-(8,74)
(8,67)-(8,69)
(8,71)-(8,73)
(10,19)-(11,71)
(11,2)-(11,71)
(11,8)-(11,9)
(11,23)-(11,25)
(11,37)-(11,71)
(11,40)-(11,45)
(11,40)-(11,41)
(11,44)-(11,45)
(11,51)-(11,64)
(11,51)-(11,61)
(11,62)-(11,64)
(11,70)-(11,71)
(13,11)-(23,34)
(13,14)-(23,34)
(14,2)-(23,34)
(14,11)-(22,51)
(15,4)-(22,51)
(15,10)-(19,65)
(15,12)-(19,65)
(16,6)-(19,65)
(16,20)-(16,21)
(17,6)-(19,65)
(17,18)-(17,19)
(18,6)-(19,65)
(18,16)-(18,29)
(18,16)-(18,25)
(18,17)-(18,19)
(18,22)-(18,24)
(18,28)-(18,29)
(19,6)-(19,65)
(19,9)-(19,16)
(19,9)-(19,12)
(19,15)-(19,16)
(19,22)-(19,44)
(19,23)-(19,24)
(19,26)-(19,43)
(19,27)-(19,37)
(19,28)-(19,31)
(19,34)-(19,36)
(19,41)-(19,42)
(19,50)-(19,65)
(19,51)-(19,52)
(19,54)-(19,64)
(19,55)-(19,58)
(19,62)-(19,63)
(20,4)-(22,51)
(20,15)-(20,22)
(20,16)-(20,17)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,69)
(21,15)-(21,27)
(21,28)-(21,48)
(21,29)-(21,41)
(21,30)-(21,38)
(21,39)-(21,40)
(21,45)-(21,47)
(21,49)-(21,69)
(21,50)-(21,62)
(21,51)-(21,59)
(21,60)-(21,61)
(21,66)-(21,68)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)