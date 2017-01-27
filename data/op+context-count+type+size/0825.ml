
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
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine [0; l1] [0; l2] in
    let (car,res) = List.fold_left f base args in res in
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
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine ([0] @ l1) ([0] @ l2) in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,29)-(19,36)
(19,30)-(19,31)
(19,37)-(19,44)
(19,38)-(19,39)
(21,20)-(21,27)
(21,28)-(21,30)
(21,31)-(21,33)
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
(12,3)-(21,33)
(12,12)-(20,54)
(13,5)-(20,54)
(13,11)-(17,61)
(13,13)-(17,61)
(14,7)-(17,61)
(14,25)-(14,26)
(15,7)-(17,61)
(15,23)-(15,24)
(16,7)-(17,61)
(17,9)-(17,37)
(17,9)-(17,61)
(17,29)-(17,30)
(17,41)-(17,44)
(17,41)-(17,61)
(17,45)-(17,46)
(17,47)-(17,61)
(17,48)-(17,60)
(18,5)-(20,54)
(18,17)-(18,18)
(18,17)-(18,22)
(18,20)-(18,22)
(19,5)-(20,54)
(19,16)-(19,28)
(19,16)-(19,44)
(19,29)-(19,36)
(19,30)-(19,31)
(19,33)-(19,35)
(19,37)-(19,44)
(19,38)-(19,39)
(19,41)-(19,43)
(20,5)-(20,54)
(20,21)-(20,35)
(20,21)-(20,47)
(20,36)-(20,37)
(20,38)-(20,42)
(20,43)-(20,47)
(20,51)-(20,54)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)