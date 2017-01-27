
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1::t1,h2::t2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [0] in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(18,15)
(19,16)-(19,19)
(19,17)-(19,18)
(20,17)-(20,19)
(20,17)-(20,23)
*)

(* type error slice
(15,5)-(20,75)
(15,11)-(18,15)
(15,13)-(18,15)
(16,7)-(18,15)
(16,13)-(16,14)
(17,30)-(17,71)
(17,50)-(17,65)
(17,50)-(17,71)
(17,70)-(17,71)
(19,5)-(20,75)
(19,16)-(19,19)
(19,17)-(19,18)
(20,5)-(20,75)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(20,42)-(20,56)
(20,42)-(20,68)
(20,57)-(20,58)
(20,59)-(20,63)
(20,64)-(20,68)
*)