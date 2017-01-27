
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, 0) in
    let base = (0, 0) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([0], [0]) in
    let base = ([0], [0]) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,18)-(20,19)
(20,21)-(20,22)
(21,17)-(21,18)
(21,20)-(21,21)
(23,20)-(23,27)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,29)-(4,37)
(4,29)-(4,55)
(4,39)-(4,47)
(4,50)-(4,55)
(5,3)-(5,11)
(5,3)-(5,16)
(5,12)-(5,14)
(5,15)-(5,16)
(7,4)-(13,47)
(7,13)-(13,43)
(7,16)-(13,43)
(8,3)-(13,43)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,3)-(13,43)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(10,3)-(13,43)
(11,3)-(13,43)
(12,10)-(12,21)
(12,10)-(12,43)
(12,10)-(12,48)
(12,23)-(12,28)
(12,23)-(12,38)
(12,29)-(12,30)
(12,41)-(12,43)
(12,46)-(12,48)
(16,3)-(16,72)
(16,52)-(16,62)
(16,52)-(16,65)
(16,63)-(16,65)
(19,3)-(23,33)
(19,12)-(22,69)
(20,5)-(22,69)
(20,11)-(20,22)
(20,13)-(20,22)
(20,18)-(20,19)
(20,18)-(20,22)
(20,21)-(20,22)
(21,5)-(22,69)
(21,17)-(21,18)
(21,17)-(21,21)
(21,20)-(21,21)
(22,5)-(22,69)
(22,16)-(22,18)
(22,22)-(22,69)
(22,36)-(22,50)
(22,36)-(22,62)
(22,51)-(22,52)
(22,53)-(22,57)
(22,58)-(22,62)
(22,66)-(22,69)
(23,3)-(23,13)
(23,3)-(23,33)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)