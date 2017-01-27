
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
(18,10)-(18,11)
(18,10)-(18,16)
(18,14)-(18,16)
(19,13)-(19,57)
(27,26)-(27,28)
(27,29)-(27,30)
(27,32)-(27,50)
(29,3)-(29,13)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(29,31)-(29,33)
*)

(* type error slice
(16,5)-(28,52)
(16,11)-(25,36)
(16,13)-(25,36)
(17,7)-(25,36)
(17,23)-(17,24)
(18,7)-(25,36)
(18,10)-(18,11)
(18,10)-(18,16)
(18,14)-(18,16)
(19,13)-(19,57)
(19,30)-(19,31)
(19,30)-(19,42)
(19,34)-(19,42)
(21,10)-(25,36)
(21,26)-(21,27)
(26,5)-(28,52)
(26,17)-(26,18)
(26,17)-(26,22)
(26,20)-(26,22)
(27,5)-(28,52)
(27,16)-(27,24)
(27,16)-(27,50)
(27,26)-(27,28)
(27,26)-(27,50)
(27,29)-(27,30)
(27,32)-(27,44)
(27,32)-(27,50)
(27,45)-(27,47)
(27,48)-(27,50)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
(28,36)-(28,40)
(28,41)-(28,45)
*)