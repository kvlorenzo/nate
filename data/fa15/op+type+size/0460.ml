
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (1, 9)
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 10
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        if (let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) = 10)
        then (let (carry,ans) = a in (1, ([9] @ ans)))
        else
          (let (carry,ans) = a in
           (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,13)-(21,19)
(21,17)-(21,18)
(23,10)-(24,59)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)

(* type error slice
(15,6)-(24,59)
(15,6)-(24,59)
(17,8)-(18,64)
(18,8)-(18,64)
(18,12)-(18,63)
(18,30)-(18,62)
(18,57)-(18,58)
(20,8)-(24,59)
(20,8)-(24,59)
(21,13)-(21,19)
(21,17)-(21,18)
(23,10)-(24,59)
(24,11)-(24,58)
(24,15)-(24,57)
(24,33)-(24,56)
(24,51)-(24,52)
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
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,62)
(6,57)-(6,58)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,18)-(6,55)
(6,19)-(6,35)
(6,20)-(6,31)
(6,32)-(6,34)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,59)-(6,61)
(6,64)-(6,66)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(28,34)
(12,14)-(28,34)
(13,2)-(28,34)
(13,11)-(27,51)
(14,4)-(27,51)
(14,10)-(24,59)
(14,12)-(24,59)
(15,6)-(24,59)
(15,9)-(15,71)
(15,27)-(15,28)
(15,32)-(15,71)
(15,44)-(15,45)
(15,49)-(15,71)
(15,49)-(15,66)
(15,50)-(15,57)
(15,51)-(15,52)
(15,55)-(15,56)
(15,60)-(15,65)
(15,69)-(15,71)
(17,8)-(18,64)
(17,26)-(17,27)
(18,8)-(18,64)
(18,9)-(18,10)
(18,12)-(18,63)
(18,25)-(18,26)
(18,30)-(18,62)
(18,57)-(18,58)
(18,30)-(18,56)
(18,31)-(18,55)
(18,31)-(18,48)
(18,32)-(18,39)
(18,33)-(18,34)
(18,37)-(18,38)
(18,42)-(18,47)
(18,53)-(18,55)
(18,59)-(18,62)
(20,8)-(24,59)
(20,11)-(20,75)
(20,30)-(20,31)
(20,35)-(20,74)
(20,47)-(20,48)
(20,52)-(20,74)
(20,52)-(20,69)
(20,53)-(20,60)
(20,54)-(20,55)
(20,58)-(20,59)
(20,63)-(20,68)
(20,72)-(20,74)
(21,13)-(21,19)
(21,14)-(21,15)
(21,17)-(21,18)
(23,10)-(24,59)
(23,29)-(23,30)
(24,11)-(24,58)
(24,12)-(24,13)
(24,15)-(24,57)
(24,28)-(24,29)
(24,33)-(24,56)
(24,51)-(24,52)
(24,33)-(24,50)
(24,34)-(24,49)
(24,34)-(24,41)
(24,35)-(24,36)
(24,39)-(24,40)
(24,44)-(24,49)
(24,53)-(24,56)
(25,4)-(27,51)
(25,15)-(25,22)
(25,16)-(25,17)
(25,19)-(25,21)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)
