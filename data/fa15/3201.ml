
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      ([v / 10], ([v / 10] @ (a2 @ [(v mod 10) + s]))) in
    let base = ([0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,11)-(27,21)
(19,6)-(23,54)
(20,6)-(23,54)
(20,18)-(20,20)
(21,6)-(23,54)
(21,18)-(21,20)
(22,26)-(22,28)
(23,7)-(23,15)
(23,30)-(23,32)
(23,36)-(23,50)
(23,49)-(23,50)
(24,16)-(24,19)
(24,22)-(24,23)
(25,15)-(25,33)
(26,4)-(26,60)
(26,50)-(26,60)
(26,51)-(26,54)
(27,2)-(27,5)
*)

(* type error slice
(20,6)-(23,54)
(22,14)-(22,28)
(22,26)-(22,28)
*)

(* all spans
(2,14)-(3,68)
(2,16)-(3,68)
(3,2)-(3,68)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,68)
(3,31)-(3,32)
(3,45)-(3,67)
(3,45)-(3,46)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(3,59)-(3,66)
(3,60)-(3,61)
(3,64)-(3,65)
(5,12)-(13,41)
(5,15)-(13,41)
(6,2)-(13,41)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(13,41)
(7,11)-(7,25)
(7,11)-(7,22)
(7,23)-(7,25)
(8,2)-(13,41)
(8,5)-(8,12)
(8,5)-(8,7)
(8,10)-(8,12)
(9,7)-(9,15)
(9,8)-(9,10)
(9,12)-(9,14)
(11,4)-(13,41)
(11,7)-(11,14)
(11,7)-(11,9)
(11,12)-(11,14)
(12,9)-(12,41)
(12,10)-(12,12)
(12,14)-(12,40)
(12,35)-(12,36)
(12,15)-(12,34)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,33)
(12,25)-(12,27)
(12,30)-(12,32)
(12,37)-(12,39)
(13,9)-(13,41)
(13,10)-(13,36)
(13,31)-(13,32)
(13,11)-(13,30)
(13,12)-(13,17)
(13,18)-(13,19)
(13,20)-(13,29)
(13,21)-(13,23)
(13,26)-(13,28)
(13,33)-(13,35)
(13,38)-(13,40)
(15,11)-(27,21)
(15,14)-(27,21)
(16,2)-(27,21)
(16,11)-(26,60)
(17,4)-(26,60)
(17,10)-(23,54)
(17,12)-(23,54)
(18,6)-(23,54)
(18,20)-(18,21)
(19,6)-(23,54)
(19,20)-(19,21)
(20,6)-(23,54)
(20,18)-(20,20)
(21,6)-(23,54)
(21,18)-(21,20)
(22,6)-(23,54)
(22,14)-(22,28)
(22,14)-(22,23)
(22,15)-(22,17)
(22,20)-(22,22)
(22,26)-(22,28)
(23,6)-(23,54)
(23,7)-(23,15)
(23,8)-(23,14)
(23,8)-(23,9)
(23,12)-(23,14)
(23,17)-(23,53)
(23,27)-(23,28)
(23,18)-(23,26)
(23,19)-(23,25)
(23,19)-(23,20)
(23,23)-(23,25)
(23,29)-(23,52)
(23,33)-(23,34)
(23,30)-(23,32)
(23,35)-(23,51)
(23,36)-(23,50)
(23,36)-(23,46)
(23,37)-(23,38)
(23,43)-(23,45)
(23,49)-(23,50)
(24,4)-(26,60)
(24,15)-(24,25)
(24,16)-(24,19)
(24,17)-(24,18)
(24,21)-(24,24)
(24,22)-(24,23)
(25,4)-(26,60)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,60)
(26,20)-(26,46)
(26,20)-(26,34)
(26,35)-(26,36)
(26,37)-(26,41)
(26,42)-(26,46)
(26,50)-(26,60)
(26,51)-(26,54)
(26,56)-(26,59)
(27,2)-(27,21)
(27,2)-(27,5)
(27,6)-(27,21)
(27,7)-(27,14)
(27,15)-(27,17)
(27,18)-(27,20)
*)
