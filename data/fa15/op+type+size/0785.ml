
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1) (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    let n = (List.length l2) - (List.length l1) in (((clone 0 n) @ l1), l2)
  else
    if (List.length l2) < (List.length l1)
    then
      (let n = (List.length l1) - (List.length l2) in
       (l1, ((clone 0 n) @ l2)))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (val1,val2) = x in
      let (lastCarry,lastTupleSum) = a in
      let tupleSum = (val1 + val2) + lastCarry in
      let newCarry = tupleSum / 10 in
      let nextDigit = tupleSum mod 10 in
      (newCarry, (nextDigit :: lastTupleSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,15)-(28,27)
(28,28)-(28,57)
(28,29)-(28,42)
(28,39)-(28,41)
(28,43)-(28,56)
(28,44)-(28,52)
(28,53)-(28,55)
*)

(* type error slice
(28,4)-(29,51)
(28,15)-(28,27)
(28,15)-(28,57)
(28,28)-(28,57)
(28,29)-(28,42)
(28,30)-(28,38)
(29,18)-(29,32)
(29,18)-(29,44)
(29,40)-(29,44)
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
(4,12)-(13,17)
(4,15)-(13,17)
(5,2)-(13,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(7,4)-(7,75)
(7,12)-(7,47)
(7,12)-(7,28)
(7,13)-(7,24)
(7,25)-(7,27)
(7,31)-(7,47)
(7,32)-(7,43)
(7,44)-(7,46)
(7,51)-(7,75)
(7,52)-(7,70)
(7,65)-(7,66)
(7,53)-(7,64)
(7,54)-(7,59)
(7,60)-(7,61)
(7,62)-(7,63)
(7,67)-(7,69)
(7,72)-(7,74)
(9,4)-(13,17)
(9,7)-(9,42)
(9,7)-(9,23)
(9,8)-(9,19)
(9,20)-(9,22)
(9,26)-(9,42)
(9,27)-(9,38)
(9,39)-(9,41)
(11,6)-(12,32)
(11,15)-(11,50)
(11,15)-(11,31)
(11,16)-(11,27)
(11,28)-(11,30)
(11,34)-(11,50)
(11,35)-(11,46)
(11,47)-(11,49)
(12,7)-(12,31)
(12,8)-(12,10)
(12,12)-(12,30)
(12,25)-(12,26)
(12,13)-(12,24)
(12,14)-(12,19)
(12,20)-(12,21)
(12,22)-(12,23)
(12,27)-(12,29)
(13,9)-(13,17)
(13,10)-(13,12)
(13,14)-(13,16)
(15,19)-(16,68)
(16,2)-(16,68)
(16,8)-(16,9)
(16,23)-(16,24)
(16,35)-(16,68)
(16,38)-(16,43)
(16,38)-(16,39)
(16,42)-(16,43)
(16,49)-(16,61)
(16,49)-(16,59)
(16,60)-(16,61)
(16,67)-(16,68)
(18,11)-(30,34)
(18,14)-(30,34)
(19,2)-(30,34)
(19,11)-(29,51)
(20,4)-(29,51)
(20,10)-(26,45)
(20,12)-(26,45)
(21,6)-(26,45)
(21,24)-(21,25)
(22,6)-(26,45)
(22,37)-(22,38)
(23,6)-(26,45)
(23,21)-(23,46)
(23,21)-(23,34)
(23,22)-(23,26)
(23,29)-(23,33)
(23,37)-(23,46)
(24,6)-(26,45)
(24,21)-(24,34)
(24,21)-(24,29)
(24,32)-(24,34)
(25,6)-(26,45)
(25,22)-(25,37)
(25,22)-(25,30)
(25,35)-(25,37)
(26,6)-(26,45)
(26,7)-(26,15)
(26,17)-(26,44)
(26,18)-(26,27)
(26,31)-(26,43)
(27,4)-(29,51)
(27,15)-(27,22)
(27,16)-(27,17)
(27,19)-(27,21)
(28,4)-(29,51)
(28,15)-(28,57)
(28,15)-(28,27)
(28,28)-(28,57)
(28,29)-(28,42)
(28,30)-(28,38)
(28,39)-(28,41)
(28,43)-(28,56)
(28,44)-(28,52)
(28,53)-(28,55)
(29,4)-(29,51)
(29,18)-(29,44)
(29,18)-(29,32)
(29,33)-(29,34)
(29,35)-(29,39)
(29,40)-(29,44)
(29,48)-(29,51)
(30,2)-(30,34)
(30,2)-(30,12)
(30,13)-(30,34)
(30,14)-(30,17)
(30,18)-(30,33)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
*)
