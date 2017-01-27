
let x x = x;;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = 0 in
    let args = [l1] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = (0, []) in
    let args = [(0, [])] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,7)-(2,12)
(2,11)-(2,12)
(4,11)-(7,16)
(19,17)-(19,18)
(19,17)-(19,22)
(20,16)-(20,17)
(21,5)-(21,71)
(21,16)-(21,20)
(21,17)-(21,19)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,55)-(21,59)
(21,60)-(21,64)
(21,68)-(21,71)
(22,3)-(22,13)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(4,4)-(7,18)
(4,11)-(7,16)
(4,13)-(7,16)
(5,3)-(7,16)
(6,29)-(6,35)
(6,29)-(6,55)
(6,36)-(6,37)
(6,39)-(6,44)
(6,47)-(6,55)
(7,3)-(7,9)
(7,3)-(7,16)
(7,10)-(7,11)
(7,12)-(7,13)
(7,14)-(7,16)
(9,4)-(12,80)
(9,13)-(12,76)
(9,16)-(12,76)
(10,3)-(12,76)
(10,7)-(10,18)
(10,7)-(10,21)
(10,19)-(10,21)
(10,26)-(10,37)
(10,26)-(10,40)
(10,38)-(10,40)
(11,10)-(11,21)
(11,10)-(11,72)
(11,10)-(11,77)
(11,23)-(11,28)
(11,23)-(11,66)
(11,29)-(11,30)
(11,33)-(11,66)
(11,70)-(11,72)
(11,75)-(11,77)
(18,3)-(22,33)
(18,12)-(21,71)
(19,5)-(21,71)
(19,11)-(19,22)
(19,13)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(19,21)-(19,22)
(20,5)-(21,71)
(20,16)-(20,17)
(21,5)-(21,71)
(21,16)-(21,20)
(21,17)-(21,19)
(21,24)-(21,71)
(21,38)-(21,52)
(21,38)-(21,64)
(21,53)-(21,54)
(21,55)-(21,59)
(21,60)-(21,64)
(21,68)-(21,71)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)
