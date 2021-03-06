
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then 0
  else
    if i = 1
    then l
    else
      if (i mod 2) = 0
      then mulByDigit (i / 2) (bigAdd l l)
      else bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else
    if i = 1
    then l
    else
      if (i mod 2) = 0
      then mulByDigit (i / 2) (bigAdd l l)
      else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(25,7)-(25,8)
*)

(* type error slice
(9,2)-(9,68)
(9,8)-(9,9)
(9,35)-(9,68)
(9,49)-(9,59)
(9,49)-(9,61)
(9,67)-(9,68)
(11,3)-(21,36)
(11,11)-(21,34)
(11,14)-(21,34)
(12,2)-(21,34)
(21,2)-(21,12)
(21,2)-(21,34)
(24,2)-(32,42)
(25,7)-(25,8)
(27,4)-(32,42)
(30,6)-(32,42)
(32,11)-(32,17)
(32,11)-(32,42)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(6,52)
(6,3)-(6,24)
(6,19)-(6,20)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,13)-(6,17)
(6,21)-(6,23)
(6,26)-(6,51)
(6,46)-(6,47)
(6,27)-(6,45)
(6,28)-(6,33)
(6,34)-(6,35)
(6,36)-(6,44)
(6,39)-(6,43)
(6,48)-(6,50)
(8,19)-(9,68)
(9,2)-(9,68)
(9,8)-(9,9)
(9,23)-(9,24)
(9,35)-(9,68)
(9,38)-(9,43)
(9,38)-(9,39)
(9,42)-(9,43)
(9,49)-(9,61)
(9,49)-(9,59)
(9,60)-(9,61)
(9,67)-(9,68)
(11,11)-(21,34)
(11,14)-(21,34)
(12,2)-(21,34)
(12,11)-(20,53)
(13,4)-(20,53)
(13,10)-(17,45)
(13,12)-(17,45)
(14,6)-(17,45)
(14,24)-(14,25)
(15,6)-(17,45)
(15,22)-(15,23)
(16,6)-(17,45)
(16,18)-(16,37)
(16,18)-(16,29)
(16,19)-(16,22)
(16,25)-(16,28)
(16,32)-(16,37)
(17,6)-(17,45)
(17,7)-(17,19)
(17,8)-(17,13)
(17,16)-(17,18)
(17,21)-(17,44)
(17,22)-(17,36)
(17,23)-(17,28)
(17,33)-(17,35)
(17,40)-(17,43)
(18,4)-(20,53)
(18,15)-(18,22)
(18,16)-(18,17)
(18,19)-(18,21)
(19,4)-(20,53)
(19,15)-(19,71)
(19,15)-(19,27)
(19,28)-(19,49)
(19,29)-(19,37)
(19,38)-(19,48)
(19,43)-(19,44)
(19,39)-(19,42)
(19,40)-(19,41)
(19,45)-(19,47)
(19,50)-(19,71)
(19,51)-(19,59)
(19,60)-(19,70)
(19,65)-(19,66)
(19,61)-(19,64)
(19,62)-(19,63)
(19,67)-(19,69)
(20,4)-(20,53)
(20,20)-(20,46)
(20,20)-(20,34)
(20,35)-(20,36)
(20,37)-(20,41)
(20,42)-(20,46)
(20,50)-(20,53)
(21,2)-(21,34)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
(23,19)-(32,42)
(23,21)-(32,42)
(24,2)-(32,42)
(24,5)-(24,10)
(24,5)-(24,6)
(24,9)-(24,10)
(25,7)-(25,8)
(27,4)-(32,42)
(27,7)-(27,12)
(27,7)-(27,8)
(27,11)-(27,12)
(28,9)-(28,10)
(30,6)-(32,42)
(30,9)-(30,22)
(30,9)-(30,18)
(30,10)-(30,11)
(30,16)-(30,17)
(30,21)-(30,22)
(31,11)-(31,42)
(31,11)-(31,21)
(31,22)-(31,29)
(31,23)-(31,24)
(31,27)-(31,28)
(31,30)-(31,42)
(31,31)-(31,37)
(31,38)-(31,39)
(31,40)-(31,41)
(32,11)-(32,42)
(32,11)-(32,17)
(32,18)-(32,19)
(32,20)-(32,42)
(32,21)-(32,31)
(32,32)-(32,39)
(32,33)-(32,34)
(32,37)-(32,38)
(32,40)-(32,41)
*)
