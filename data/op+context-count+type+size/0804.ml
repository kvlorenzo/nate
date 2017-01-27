
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
          let addit = ((List.hd l1') + (List.hd l2')) + carry in
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
(15,7)-(19,74)
(16,21)-(16,22)
(16,21)-(16,64)
(16,25)-(16,64)
(16,28)-(16,33)
(16,28)-(16,37)
(16,36)-(16,37)
(16,43)-(16,48)
(16,43)-(16,55)
(16,52)-(16,55)
(16,61)-(16,64)
(18,25)-(18,32)
(18,25)-(18,36)
(18,41)-(18,48)
(18,41)-(18,52)
(22,49)-(22,52)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(6,55)
(4,13)-(6,51)
(4,16)-(6,51)
(5,3)-(6,51)
(5,15)-(5,26)
(5,15)-(5,29)
(5,15)-(5,48)
(5,27)-(5,29)
(5,34)-(5,45)
(5,34)-(5,48)
(5,46)-(5,48)
(6,6)-(6,11)
(6,6)-(6,18)
(6,6)-(6,24)
(6,6)-(6,51)
(6,12)-(6,13)
(6,14)-(6,18)
(6,20)-(6,21)
(6,22)-(6,24)
(6,29)-(6,34)
(6,29)-(6,44)
(6,29)-(6,51)
(6,35)-(6,36)
(6,47)-(6,48)
(6,49)-(6,51)
(12,3)-(23,33)
(12,12)-(22,52)
(13,5)-(22,52)
(13,11)-(19,74)
(13,13)-(19,74)
(14,7)-(19,74)
(14,25)-(14,26)
(15,7)-(19,74)
(15,13)-(15,14)
(16,21)-(16,22)
(16,21)-(16,64)
(16,25)-(16,64)
(16,43)-(16,55)
(20,5)-(22,52)
(20,17)-(20,18)
(20,17)-(20,22)
(20,20)-(20,22)
(21,5)-(22,52)
(21,16)-(21,28)
(21,16)-(21,34)
(21,29)-(21,31)
(21,32)-(21,34)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
(22,49)-(22,52)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)