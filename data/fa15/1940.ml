
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in x1 + x2 in
    let base = [(0, 0)] List.combine l1 l2 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,35)-(17,37)
(17,35)-(17,42)
(18,4)-(20,51)
(18,15)-(18,23)
(18,15)-(18,42)
(18,20)-(18,21)
(18,24)-(18,36)
(18,37)-(18,39)
(18,40)-(18,42)
*)

(* type error slice
(17,4)-(20,51)
(17,10)-(17,42)
(17,12)-(17,42)
(17,16)-(17,42)
(17,35)-(17,42)
(18,15)-(18,23)
(18,15)-(18,42)
(20,4)-(20,51)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
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
(4,12)-(10,17)
(4,15)-(10,17)
(5,2)-(10,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,10)
(6,12)-(6,66)
(6,61)-(6,62)
(6,13)-(6,60)
(6,14)-(6,19)
(6,20)-(6,21)
(6,22)-(6,59)
(6,23)-(6,39)
(6,24)-(6,35)
(6,36)-(6,38)
(6,42)-(6,58)
(6,43)-(6,54)
(6,55)-(6,57)
(6,63)-(6,65)
(8,4)-(10,17)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,64)
(9,59)-(9,60)
(9,11)-(9,58)
(9,12)-(9,17)
(9,18)-(9,19)
(9,20)-(9,57)
(9,21)-(9,37)
(9,22)-(9,33)
(9,34)-(9,36)
(9,40)-(9,56)
(9,41)-(9,52)
(9,53)-(9,55)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
(12,19)-(13,74)
(13,2)-(13,74)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,74)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,74)
(13,68)-(13,69)
(13,73)-(13,74)
(15,11)-(21,34)
(15,14)-(21,34)
(16,2)-(21,34)
(16,11)-(20,51)
(17,4)-(20,51)
(17,10)-(17,42)
(17,12)-(17,42)
(17,16)-(17,42)
(17,30)-(17,31)
(17,35)-(17,42)
(17,35)-(17,37)
(17,40)-(17,42)
(18,4)-(20,51)
(18,15)-(18,42)
(18,15)-(18,23)
(18,16)-(18,22)
(18,17)-(18,18)
(18,20)-(18,21)
(18,24)-(18,36)
(18,37)-(18,39)
(18,40)-(18,42)
(19,4)-(20,51)
(19,15)-(19,44)
(19,15)-(19,23)
(19,24)-(19,44)
(19,25)-(19,37)
(19,38)-(19,40)
(19,41)-(19,43)
(20,4)-(20,51)
(20,18)-(20,44)
(20,18)-(20,32)
(20,33)-(20,34)
(20,35)-(20,39)
(20,40)-(20,44)
(20,48)-(20,51)
(21,2)-(21,34)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)
