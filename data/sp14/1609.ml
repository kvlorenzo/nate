
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
      if s
      then c :: s
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
      match (c, s) with
      | (c,[]) -> (c, (c :: s))
      | _ -> ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(20,70)
(18,9)-(18,10)
(19,11)-(19,17)
*)

(* type error slice
(15,4)-(23,51)
(15,10)-(20,70)
(15,12)-(20,70)
(16,6)-(20,70)
(17,6)-(20,70)
(17,6)-(20,70)
(17,18)-(17,19)
(18,6)-(20,70)
(18,6)-(20,70)
(18,6)-(20,70)
(18,9)-(18,10)
(19,11)-(19,17)
(19,11)-(19,17)
(19,16)-(19,17)
(20,11)-(20,70)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,16)-(8,67)
(5,19)-(8,67)
(6,2)-(8,67)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,67)
(7,8)-(7,10)
(7,12)-(7,66)
(7,61)-(7,62)
(7,13)-(7,60)
(7,14)-(7,19)
(7,20)-(7,21)
(7,22)-(7,59)
(7,23)-(7,39)
(7,24)-(7,35)
(7,36)-(7,38)
(7,42)-(7,58)
(7,43)-(7,54)
(7,55)-(7,57)
(7,63)-(7,65)
(8,7)-(8,67)
(8,8)-(8,62)
(8,57)-(8,58)
(8,9)-(8,56)
(8,10)-(8,15)
(8,16)-(8,17)
(8,18)-(8,55)
(8,19)-(8,35)
(8,20)-(8,31)
(8,32)-(8,34)
(8,38)-(8,54)
(8,39)-(8,50)
(8,51)-(8,53)
(8,59)-(8,61)
(8,64)-(8,66)
(10,19)-(11,69)
(11,2)-(11,69)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,69)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,69)
(13,11)-(24,34)
(13,14)-(24,34)
(14,2)-(24,34)
(14,11)-(23,51)
(15,4)-(23,51)
(15,10)-(20,70)
(15,12)-(20,70)
(16,6)-(20,70)
(16,21)-(16,22)
(17,6)-(20,70)
(17,18)-(17,19)
(18,6)-(20,70)
(18,9)-(18,10)
(19,11)-(19,17)
(19,11)-(19,12)
(19,16)-(19,17)
(20,11)-(20,70)
(20,12)-(20,35)
(20,13)-(20,29)
(20,14)-(20,22)
(20,15)-(20,16)
(20,19)-(20,21)
(20,25)-(20,28)
(20,32)-(20,34)
(20,37)-(20,69)
(20,38)-(20,63)
(20,39)-(20,55)
(20,40)-(20,48)
(20,41)-(20,42)
(20,45)-(20,47)
(20,51)-(20,54)
(20,60)-(20,62)
(20,67)-(20,68)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,44)
(22,15)-(22,23)
(22,24)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
