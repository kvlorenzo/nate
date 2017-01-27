
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else bigAdd (mulByDigit (i - 1) l) [0];;

*)

(* changed spans
(34,26)-(34,68)
(34,29)-(34,34)
(34,40)-(34,46)
(34,40)-(34,68)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(11,53)
(4,13)-(11,49)
(4,16)-(11,49)
(5,3)-(11,49)
(5,14)-(5,25)
(5,14)-(5,28)
(5,26)-(5,28)
(6,3)-(11,49)
(6,14)-(6,25)
(6,14)-(6,28)
(6,26)-(6,28)
(7,3)-(11,49)
(7,17)-(7,47)
(7,37)-(7,39)
(8,3)-(11,49)
(8,15)-(8,64)
(8,36)-(8,47)
(9,3)-(11,49)
(10,10)-(10,21)
(10,10)-(10,45)
(10,10)-(10,50)
(10,23)-(10,28)
(10,23)-(10,36)
(10,29)-(10,30)
(10,31)-(10,36)
(10,38)-(10,45)
(10,48)-(10,50)
(14,3)-(14,70)
(14,51)-(14,61)
(14,51)-(14,63)
(14,62)-(14,63)
(16,4)-(32,37)
(16,12)-(32,33)
(16,15)-(32,33)
(17,3)-(32,33)
(17,12)-(31,52)
(18,5)-(31,52)
(18,11)-(28,29)
(18,13)-(28,29)
(19,7)-(28,29)
(20,7)-(28,29)
(20,21)-(20,29)
(20,28)-(20,29)
(21,7)-(28,29)
(21,19)-(21,27)
(21,19)-(21,29)
(21,28)-(21,29)
(22,7)-(28,29)
(23,7)-(28,29)
(24,7)-(28,29)
(24,16)-(24,28)
(24,23)-(24,24)
(24,23)-(24,28)
(24,27)-(24,28)
(25,7)-(28,29)
(25,20)-(25,23)
(25,20)-(25,25)
(25,24)-(25,25)
(26,7)-(28,29)
(27,13)-(27,14)
(27,13)-(27,41)
(27,17)-(27,41)
(29,5)-(31,52)
(29,17)-(29,18)
(29,17)-(29,22)
(29,20)-(29,22)
(30,5)-(31,52)
(30,16)-(30,24)
(30,16)-(30,44)
(30,26)-(30,38)
(30,26)-(30,44)
(30,39)-(30,41)
(30,42)-(30,44)
(31,5)-(31,52)
(31,19)-(31,33)
(31,19)-(31,45)
(31,34)-(31,35)
(31,36)-(31,40)
(31,41)-(31,45)
(31,49)-(31,52)
(32,3)-(32,13)
(32,3)-(32,33)
(32,15)-(32,18)
(32,15)-(32,33)
(32,20)-(32,27)
(32,20)-(32,33)
(32,28)-(32,30)
(32,31)-(32,33)
(34,4)-(34,71)
(34,20)-(34,68)
(34,22)-(34,68)
(34,26)-(34,68)
(34,29)-(34,30)
(34,29)-(34,34)
(34,33)-(34,34)
(34,40)-(34,46)
(34,40)-(34,68)
(34,48)-(34,58)
(34,48)-(34,68)
(34,60)-(34,65)
(34,67)-(34,68)
*)
