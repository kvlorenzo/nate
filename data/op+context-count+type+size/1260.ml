
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x c =
      let (s,t) = x in
      let sum = (c + s) + t in ((sum / 10), ((sum mod 10) :: a)) in
    let base = (0, [0]) in
    let args = ((List.rev (List.hd l1)), (List.rev (List.hd l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,15)-(17,63)
(17,18)-(17,28)
(17,22)-(17,23)
(17,27)-(17,28)
(17,34)-(17,37)
(17,34)-(17,42)
(17,34)-(17,63)
(17,40)-(17,42)
(17,47)-(17,50)
(17,55)-(17,57)
(17,62)-(17,63)
(18,20)-(18,23)
(18,21)-(18,22)
(19,18)-(19,63)
(19,28)-(19,35)
(19,28)-(19,38)
(19,36)-(19,38)
(19,43)-(19,51)
(19,43)-(19,63)
(19,53)-(19,60)
(19,53)-(19,63)
*)

(* type error slice
(3,51)-(3,56)
(3,51)-(3,65)
(3,57)-(3,58)
(3,60)-(3,65)
(5,4)-(8,70)
(5,17)-(8,67)
(5,20)-(8,67)
(6,3)-(8,67)
(6,7)-(6,18)
(6,7)-(6,21)
(6,19)-(6,21)
(6,26)-(6,37)
(6,26)-(6,40)
(6,38)-(6,40)
(7,9)-(7,11)
(7,9)-(7,66)
(7,15)-(7,20)
(7,15)-(7,58)
(7,15)-(7,66)
(7,21)-(7,22)
(7,25)-(7,58)
(7,62)-(7,63)
(7,64)-(7,66)
(14,3)-(21,33)
(14,12)-(20,52)
(15,5)-(20,52)
(15,11)-(17,63)
(15,13)-(17,63)
(15,15)-(17,63)
(16,7)-(17,63)
(16,19)-(16,20)
(17,7)-(17,63)
(17,18)-(17,19)
(17,18)-(17,23)
(17,34)-(17,42)
(17,34)-(17,63)
(17,47)-(17,57)
(17,47)-(17,63)
(17,62)-(17,63)
(18,5)-(20,52)
(18,17)-(18,18)
(18,17)-(18,23)
(18,20)-(18,23)
(18,21)-(18,22)
(19,5)-(20,52)
(19,18)-(19,26)
(19,18)-(19,38)
(19,18)-(19,63)
(19,28)-(19,35)
(19,28)-(19,38)
(19,36)-(19,38)
(19,43)-(19,51)
(19,43)-(19,63)
(19,53)-(19,60)
(19,53)-(19,63)
(19,61)-(19,63)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
(20,49)-(20,52)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)
