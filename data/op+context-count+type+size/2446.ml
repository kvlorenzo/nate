
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let x = padZero [9; 9] [1; 0; 0; 2];;

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
  let add (l1,l2) acc =
    let f a x = match x with | (h1,h2)::t -> (h1 + h2) :: acc in
    let base = acc in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
(2,11)-(5,16)
(12,9)-(12,16)
(12,9)-(12,36)
(12,17)-(12,23)
(12,18)-(12,19)
(12,21)-(12,22)
(12,24)-(12,36)
(12,25)-(12,26)
(12,28)-(12,29)
(12,31)-(12,32)
(12,34)-(12,35)
(14,11)-(17,16)
(14,13)-(17,16)
(15,3)-(17,16)
(15,18)-(16,55)
(15,20)-(16,55)
(15,22)-(16,55)
(16,5)-(16,55)
(16,8)-(16,9)
(16,8)-(16,14)
(16,13)-(16,14)
(16,20)-(16,23)
(16,29)-(16,35)
(16,29)-(16,55)
(16,39)-(16,40)
(16,39)-(16,44)
(16,43)-(16,44)
(16,47)-(16,55)
(16,52)-(16,55)
(17,3)-(17,9)
(17,3)-(17,16)
(17,10)-(17,11)
(17,12)-(17,13)
(17,14)-(17,16)
(20,3)-(22,76)
(20,7)-(20,18)
(20,7)-(20,21)
(20,7)-(20,40)
(20,19)-(20,21)
(20,26)-(20,37)
(20,26)-(20,40)
(20,38)-(20,40)
(21,10)-(21,21)
(21,10)-(21,72)
(21,10)-(21,77)
(21,23)-(21,28)
(21,23)-(21,66)
(21,33)-(21,44)
(21,33)-(21,47)
(21,33)-(21,66)
(21,45)-(21,47)
(21,52)-(21,63)
(21,64)-(21,66)
(21,70)-(21,72)
(21,75)-(21,77)
(22,9)-(22,11)
(22,9)-(22,76)
(22,14)-(22,25)
(22,14)-(22,76)
(22,27)-(22,32)
(22,33)-(22,34)
(22,37)-(22,70)
(22,74)-(22,76)
(24,20)-(25,78)
(27,12)-(33,33)
*)

(* type error slice
(14,4)-(17,18)
(14,11)-(17,16)
(14,13)-(17,16)
(15,3)-(17,16)
(16,29)-(16,35)
(16,29)-(16,55)
(16,36)-(16,37)
(16,39)-(16,44)
(16,47)-(16,55)
(17,3)-(17,9)
(17,3)-(17,16)
(17,10)-(17,11)
(17,12)-(17,13)
(17,14)-(17,16)
(19,4)-(22,80)
(19,13)-(22,76)
(19,16)-(22,76)
(20,3)-(22,76)
(20,7)-(20,18)
(20,7)-(20,21)
(20,19)-(20,21)
(20,26)-(20,37)
(20,26)-(20,40)
(20,38)-(20,40)
(21,10)-(21,21)
(21,10)-(21,72)
(21,10)-(21,77)
(21,23)-(21,28)
(21,23)-(21,66)
(21,29)-(21,30)
(21,33)-(21,66)
(21,70)-(21,72)
(21,75)-(21,77)
(25,3)-(25,78)
(25,52)-(25,62)
(25,52)-(25,65)
(25,63)-(25,65)
(28,3)-(33,33)
(28,12)-(32,52)
(28,19)-(32,52)
(29,5)-(32,52)
(29,11)-(29,62)
(29,13)-(29,62)
(29,17)-(29,62)
(29,23)-(29,24)
(29,47)-(29,54)
(29,47)-(29,62)
(29,59)-(29,62)
(30,5)-(32,52)
(30,16)-(30,19)
(31,5)-(32,52)
(31,16)-(31,28)
(31,16)-(31,34)
(31,29)-(31,31)
(31,32)-(31,34)
(32,5)-(32,52)
(32,19)-(32,33)
(32,19)-(32,45)
(32,34)-(32,35)
(32,36)-(32,40)
(32,41)-(32,45)
(32,49)-(32,52)
(33,3)-(33,13)
(33,3)-(33,33)
(33,15)-(33,18)
(33,15)-(33,33)
(33,20)-(33,27)
(33,20)-(33,33)
(33,28)-(33,30)
(33,31)-(33,33)
*)