
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
        ((List.length acc) = ((List.length l1) - 1)) ||
          ((List.length acc) = ((List.length l2) - 1))
      then (if rem = 1 then (0, ([1; 0] :: acc)) else (0, acc))
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
        ((List.length acc) = ((List.length l1) - 1)) ||
          ((List.length acc) = ((List.length l2) - 1))
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
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
(21,34)-(21,40)
(21,34)-(21,47)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(9,48)
(4,13)-(9,45)
(4,16)-(9,45)
(5,3)-(9,45)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(9,45)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,3)-(9,45)
(8,9)-(8,11)
(8,9)-(8,44)
(8,15)-(8,20)
(8,15)-(8,37)
(8,15)-(8,44)
(8,21)-(8,22)
(8,24)-(8,37)
(8,40)-(8,41)
(8,42)-(8,44)
(12,3)-(12,75)
(12,51)-(12,61)
(12,51)-(12,63)
(12,62)-(12,63)
(15,3)-(31,33)
(15,12)-(30,52)
(16,5)-(30,52)
(16,11)-(27,36)
(16,13)-(27,36)
(17,7)-(27,36)
(17,23)-(17,24)
(18,7)-(27,36)
(19,11)-(19,22)
(19,11)-(19,26)
(19,23)-(19,26)
(19,32)-(19,43)
(19,32)-(19,46)
(19,44)-(19,46)
(20,34)-(20,45)
(20,34)-(20,48)
(20,46)-(20,48)
(21,13)-(21,62)
(21,30)-(21,31)
(21,30)-(21,47)
(21,34)-(21,47)
(23,10)-(27,36)
(23,26)-(23,27)
(24,10)-(27,36)
(25,10)-(27,36)
(25,24)-(25,52)
(25,44)-(25,45)
(26,10)-(27,36)
(26,25)-(26,70)
(26,45)-(26,57)
(27,11)-(27,18)
(27,11)-(27,36)
(27,21)-(27,29)
(27,21)-(27,36)
(27,33)-(27,36)
(28,5)-(30,52)
(28,17)-(28,18)
(28,17)-(28,22)
(28,20)-(28,22)
(29,5)-(30,52)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(29,39)-(29,41)
(29,42)-(29,44)
(30,5)-(30,52)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
(30,49)-(30,52)
(31,3)-(31,13)
(31,3)-(31,33)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
*)
