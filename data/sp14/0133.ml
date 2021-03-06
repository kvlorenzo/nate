
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
      match x with
      | ([],[]) -> (0, (if carry > 0 then carry :: num else num))
      | (l1',l2') ->
          let addit = (l1' + l2') + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(19,75)
(16,19)-(16,65)
(16,20)-(16,21)
(16,23)-(16,64)
(16,27)-(16,32)
(16,27)-(16,36)
(16,35)-(16,36)
(16,42)-(16,47)
(16,42)-(16,54)
(16,51)-(16,54)
(16,60)-(16,63)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(6,54)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(6,2)-(6,52)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,26)-(6,51)
(6,27)-(6,45)
(6,28)-(6,33)
(6,46)-(6,47)
(12,2)-(23,34)
(12,11)-(22,51)
(13,4)-(22,51)
(13,10)-(19,75)
(13,12)-(19,75)
(15,6)-(19,75)
(15,12)-(15,13)
(18,22)-(18,33)
(18,23)-(18,26)
(21,4)-(22,51)
(21,15)-(21,27)
(21,15)-(21,33)
(21,31)-(21,33)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
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
(11,11)-(23,34)
(11,14)-(23,34)
(12,2)-(23,34)
(12,11)-(22,51)
(13,4)-(22,51)
(13,10)-(19,75)
(13,12)-(19,75)
(14,6)-(19,75)
(14,24)-(14,25)
(15,6)-(19,75)
(15,12)-(15,13)
(16,19)-(16,65)
(16,20)-(16,21)
(16,23)-(16,64)
(16,27)-(16,36)
(16,27)-(16,32)
(16,35)-(16,36)
(16,42)-(16,54)
(16,42)-(16,47)
(16,51)-(16,54)
(16,60)-(16,63)
(18,10)-(19,75)
(18,22)-(18,41)
(18,22)-(18,33)
(18,23)-(18,26)
(18,29)-(18,32)
(18,36)-(18,41)
(19,10)-(19,75)
(19,11)-(19,51)
(19,15)-(19,25)
(19,15)-(19,20)
(19,23)-(19,25)
(19,31)-(19,43)
(19,31)-(19,36)
(19,41)-(19,43)
(19,49)-(19,50)
(19,53)-(19,74)
(19,54)-(19,66)
(19,55)-(19,60)
(19,63)-(19,65)
(19,70)-(19,73)
(20,4)-(22,51)
(20,15)-(20,22)
(20,16)-(20,17)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,33)
(21,15)-(21,27)
(21,28)-(21,30)
(21,31)-(21,33)
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
