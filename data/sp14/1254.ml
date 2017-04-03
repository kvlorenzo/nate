
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if x = []
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev ([] @ (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        ((List.length acc) = (List.length l1)) ||
          ((List.length acc) = (List.length l2))
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,9)-(18,10)
(18,9)-(18,15)
(18,13)-(18,15)
(19,11)-(19,58)
(27,25)-(27,27)
(27,28)-(27,29)
(27,30)-(27,50)
*)

(* type error slice
(16,4)-(28,51)
(16,10)-(25,38)
(16,12)-(25,38)
(18,9)-(18,10)
(18,9)-(18,15)
(18,9)-(18,15)
(18,13)-(18,15)
(21,8)-(25,38)
(21,25)-(21,26)
(27,4)-(28,51)
(27,15)-(27,23)
(27,15)-(27,51)
(27,24)-(27,51)
(27,28)-(27,29)
(27,30)-(27,50)
(27,31)-(27,43)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
(28,40)-(28,44)
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
(4,12)-(9,45)
(4,15)-(9,45)
(5,2)-(9,45)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(9,45)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(9,45)
(7,5)-(7,18)
(7,5)-(7,10)
(7,13)-(7,18)
(8,7)-(8,45)
(8,8)-(8,10)
(8,12)-(8,44)
(8,39)-(8,40)
(8,13)-(8,38)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,37)
(8,23)-(8,28)
(8,31)-(8,36)
(8,41)-(8,43)
(9,7)-(9,45)
(9,8)-(9,40)
(9,35)-(9,36)
(9,9)-(9,34)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,33)
(9,19)-(9,24)
(9,27)-(9,32)
(9,37)-(9,39)
(9,42)-(9,44)
(11,19)-(12,74)
(12,2)-(12,74)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,74)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,74)
(12,68)-(12,69)
(12,73)-(12,74)
(14,11)-(29,34)
(14,14)-(29,34)
(15,2)-(29,34)
(15,11)-(28,51)
(16,4)-(28,51)
(16,10)-(25,38)
(16,12)-(25,38)
(17,6)-(25,38)
(17,22)-(17,23)
(18,6)-(25,38)
(18,9)-(18,15)
(18,9)-(18,10)
(18,13)-(18,15)
(19,11)-(19,58)
(19,15)-(19,22)
(19,15)-(19,18)
(19,21)-(19,22)
(19,28)-(19,43)
(19,29)-(19,30)
(19,32)-(19,42)
(19,33)-(19,34)
(19,38)-(19,41)
(19,49)-(19,57)
(19,50)-(19,51)
(19,53)-(19,56)
(21,8)-(25,38)
(21,25)-(21,26)
(22,9)-(25,37)
(22,23)-(22,40)
(22,23)-(22,34)
(22,24)-(22,27)
(22,30)-(22,33)
(22,37)-(22,40)
(23,9)-(25,37)
(23,23)-(23,51)
(23,26)-(23,37)
(23,26)-(23,33)
(23,36)-(23,37)
(23,43)-(23,44)
(23,50)-(23,51)
(24,9)-(25,37)
(24,24)-(24,69)
(24,27)-(24,38)
(24,27)-(24,34)
(24,37)-(24,38)
(24,44)-(24,56)
(24,44)-(24,51)
(24,54)-(24,56)
(24,62)-(24,69)
(25,9)-(25,37)
(25,10)-(25,17)
(25,19)-(25,36)
(25,20)-(25,28)
(25,32)-(25,35)
(26,4)-(28,51)
(26,15)-(26,22)
(26,16)-(26,17)
(26,19)-(26,21)
(27,4)-(28,51)
(27,15)-(27,51)
(27,15)-(27,23)
(27,24)-(27,51)
(27,28)-(27,29)
(27,25)-(27,27)
(27,30)-(27,50)
(27,31)-(27,43)
(27,44)-(27,46)
(27,47)-(27,49)
(28,4)-(28,51)
(28,18)-(28,44)
(28,18)-(28,32)
(28,33)-(28,34)
(28,35)-(28,39)
(28,40)-(28,44)
(28,48)-(28,51)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)
