
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in (s, t) ::
        (((((i + j) + s) + t) / 10), ((((i + j) + s) + t) mod 10)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,25)-(21,26)
(21,25)-(22,65)
(21,28)-(21,29)
(22,14)-(22,19)
(22,14)-(22,65)
(22,28)-(22,29)
(22,42)-(22,47)
(22,42)-(22,65)
(22,56)-(22,57)
(23,5)-(25,52)
*)

(* type error slice
(19,5)-(25,52)
(19,11)-(22,65)
(19,13)-(22,65)
(20,7)-(22,65)
(20,19)-(20,20)
(21,7)-(22,65)
(21,19)-(21,20)
(21,25)-(21,26)
(21,25)-(21,29)
(21,25)-(22,65)
(21,28)-(21,29)
(22,14)-(22,35)
(22,14)-(22,65)
(22,42)-(22,65)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,22)
(23,20)-(23,22)
(24,5)-(25,52)
(24,16)-(24,28)
(24,16)-(24,55)
(24,30)-(24,38)
(24,30)-(24,41)
(24,39)-(24,41)
(24,44)-(24,52)
(24,44)-(24,55)
(24,53)-(24,55)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
*)