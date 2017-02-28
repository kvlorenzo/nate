
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      (((((addition (m, n)) + y) / 10) @ z),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in
      ((((addition (m, n)) + y) / 10),
        ([((addition (m, n)) + y) mod 10] @ z)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,7)-(23,43)
(23,39)-(23,40)
(23,41)-(23,42)
(26,15)-(26,23)
(26,15)-(26,44)
(28,19)-(28,26)
*)

(* type error slice
(23,7)-(23,43)
(23,8)-(23,38)
(23,39)-(23,40)
*)

(* all spans
(2,20)-(3,54)
(2,22)-(3,54)
(2,24)-(3,54)
(3,2)-(3,54)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,18)
(3,24)-(3,54)
(3,24)-(3,35)
(3,36)-(3,37)
(3,38)-(3,45)
(3,39)-(3,40)
(3,43)-(3,44)
(3,46)-(3,54)
(3,47)-(3,48)
(3,52)-(3,53)
(5,14)-(5,60)
(5,16)-(5,60)
(5,20)-(5,60)
(5,23)-(5,28)
(5,23)-(5,24)
(5,27)-(5,28)
(5,34)-(5,36)
(5,42)-(5,60)
(5,42)-(5,53)
(5,54)-(5,55)
(5,56)-(5,57)
(5,58)-(5,60)
(7,14)-(7,26)
(7,21)-(7,26)
(7,21)-(7,22)
(7,25)-(7,26)
(9,12)-(13,65)
(9,15)-(13,65)
(10,2)-(13,65)
(10,13)-(10,48)
(10,13)-(10,29)
(10,14)-(10,25)
(10,26)-(10,28)
(10,32)-(10,48)
(10,33)-(10,44)
(10,45)-(10,47)
(11,2)-(13,65)
(11,5)-(11,13)
(11,5)-(11,9)
(11,12)-(11,13)
(12,7)-(12,43)
(12,8)-(12,38)
(12,33)-(12,34)
(12,9)-(12,32)
(12,10)-(12,15)
(12,16)-(12,17)
(12,18)-(12,31)
(12,19)-(12,23)
(12,26)-(12,30)
(12,35)-(12,37)
(12,40)-(12,42)
(13,7)-(13,65)
(13,10)-(13,18)
(13,10)-(13,14)
(13,17)-(13,18)
(13,24)-(13,51)
(13,25)-(13,27)
(13,29)-(13,50)
(13,45)-(13,46)
(13,30)-(13,44)
(13,31)-(13,36)
(13,37)-(13,38)
(13,39)-(13,43)
(13,47)-(13,49)
(13,57)-(13,65)
(13,58)-(13,60)
(13,62)-(13,64)
(15,19)-(16,73)
(16,2)-(16,73)
(16,8)-(16,9)
(16,23)-(16,25)
(16,38)-(16,73)
(16,41)-(16,47)
(16,41)-(16,43)
(16,46)-(16,47)
(16,53)-(16,66)
(16,53)-(16,63)
(16,64)-(16,66)
(16,72)-(16,73)
(18,11)-(28,34)
(18,14)-(28,34)
(19,2)-(28,34)
(19,11)-(27,51)
(20,4)-(27,51)
(20,10)-(24,47)
(20,12)-(24,47)
(21,6)-(24,47)
(21,18)-(21,19)
(22,6)-(24,47)
(22,18)-(22,19)
(23,6)-(24,47)
(23,7)-(23,43)
(23,39)-(23,40)
(23,8)-(23,38)
(23,9)-(23,32)
(23,10)-(23,27)
(23,11)-(23,19)
(23,20)-(23,26)
(23,21)-(23,22)
(23,24)-(23,25)
(23,30)-(23,31)
(23,35)-(23,37)
(23,41)-(23,42)
(24,8)-(24,46)
(24,42)-(24,43)
(24,9)-(24,41)
(24,10)-(24,40)
(24,10)-(24,33)
(24,11)-(24,28)
(24,12)-(24,20)
(24,21)-(24,27)
(24,22)-(24,23)
(24,25)-(24,26)
(24,31)-(24,32)
(24,38)-(24,40)
(24,44)-(24,45)
(25,4)-(27,51)
(25,15)-(25,22)
(25,16)-(25,17)
(25,19)-(25,21)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)
