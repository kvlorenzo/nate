
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
      | (h1::t1,h2::t2) ->
          ([], (((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a))
      | _ -> ([], a) in
    let base = [0] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
(16,7)-(19,20)
(18,12)-(18,14)
(18,12)-(18,60)
(19,15)-(19,17)
(19,15)-(19,20)
(20,16)-(20,19)
(20,17)-(20,18)
*)

(* type error slice
(15,5)-(22,52)
(15,11)-(19,20)
(15,13)-(19,20)
(16,7)-(19,20)
(16,13)-(16,14)
(18,12)-(18,14)
(18,12)-(18,60)
(18,19)-(18,60)
(18,39)-(18,54)
(18,39)-(18,60)
(18,59)-(18,60)
(20,5)-(22,52)
(20,16)-(20,19)
(20,17)-(20,18)
(21,5)-(22,52)
(21,16)-(21,28)
(21,16)-(21,34)
(21,29)-(21,31)
(21,32)-(21,34)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
*)