
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,_) = a in a = ((t, (h + x)) :: a) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (h::t,_) = a in ([], []) in
    let base = ((List.rev l1), []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,36)-(19,37)
EMPTY
EmptyG

(19,36)-(19,59)
EMPTY
EmptyG

(19,40)-(19,59)
EMPTY
EmptyG

(19,42)-(19,43)
EMPTY
EmptyG

(19,45)-(19,52)
EMPTY
EmptyG

(19,46)-(19,47)
EMPTY
EmptyG

(19,50)-(19,51)
EMPTY
EmptyG

(19,57)-(19,58)
[]
ListG EmptyG Nothing

(20,4)-(21,68)
[]
ListG EmptyG Nothing

*)
