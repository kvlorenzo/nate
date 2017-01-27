
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,18)
(20,17)-(20,18)
(20,17)-(20,21)
(20,20)-(20,21)
(21,16)-(21,24)
(21,16)-(21,44)
(21,26)-(21,38)
(21,26)-(21,44)
(21,39)-(21,41)
(21,42)-(21,44)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
(22,49)-(22,52)
(23,3)-(23,13)
(23,3)-(23,33)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(9,42)
(4,13)-(9,38)
(4,16)-(9,38)
(5,3)-(9,38)
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,3)-(9,38)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(7,3)-(9,38)
(8,11)-(8,16)
(8,11)-(8,27)
(8,11)-(8,34)
(8,11)-(8,39)
(8,17)-(8,18)
(8,20)-(8,27)
(8,30)-(8,31)
(8,32)-(8,34)
(8,37)-(8,39)
(12,3)-(15,47)
(15,35)-(15,45)
(15,35)-(15,47)
(15,46)-(15,47)
(18,3)-(23,33)
(18,12)-(22,52)
(19,5)-(22,52)
(19,11)-(19,18)
(19,13)-(19,18)
(19,17)-(19,18)
(20,5)-(22,52)
(20,17)-(20,18)
(20,17)-(20,21)
(20,20)-(20,21)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,44)
(21,26)-(21,38)
(21,26)-(21,44)
(21,39)-(21,41)
(21,42)-(21,44)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
(22,49)-(22,52)
(23,3)-(23,13)
(23,3)-(23,33)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)
