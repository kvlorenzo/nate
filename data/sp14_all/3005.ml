
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
    let args = (l1, 2) in let (_,res) = List.fold_left f base args in res in
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
    let f a x = (0, []) in
    let base = (0, []) in
    let args = clone 0 (List.length l1) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,17)-(20,20)
EMPTY
EmptyG

(20,22)-(20,25)
EMPTY
EmptyG

(20,23)-(20,24)
[]
ListG EmptyG Nothing

(21,16)-(21,19)
EMPTY
EmptyG

(21,21)-(21,24)
EMPTY
EmptyG

(21,22)-(21,23)
[]
ListG EmptyG Nothing

(22,15)-(22,22)
clone 0 (List.length l1)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(22,16)-(22,18)
List.length l1
AppG (fromList [VarG])

(22,20)-(22,21)
EMPTY
EmptyG

*)
