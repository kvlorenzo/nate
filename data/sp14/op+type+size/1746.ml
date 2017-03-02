
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x = if x < 10 then x else [intlist (x / 10); x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) :: t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,41)-(18,42)
(18,48)-(18,76)
(18,49)-(18,65)
(18,67)-(18,75)
(21,10)-(23,65)
(22,18)-(22,54)
(22,28)-(22,39)
(22,29)-(22,30)
(23,21)-(23,64)
(23,46)-(23,59)
(23,46)-(23,64)
(24,4)-(26,47)
(25,4)-(26,47)
(26,4)-(26,47)
*)

(* type error slice
(17,4)-(26,47)
(17,10)-(23,65)
(18,26)-(18,76)
(18,26)-(18,76)
(18,29)-(18,30)
(18,29)-(18,35)
(18,29)-(18,35)
(18,33)-(18,35)
(18,41)-(18,42)
(18,48)-(18,76)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,10)-(23,65)
(21,17)-(21,18)
(22,18)-(22,54)
(22,28)-(22,35)
(22,29)-(22,30)
(22,43)-(22,50)
(22,43)-(22,54)
(23,21)-(23,64)
(23,46)-(23,59)
(23,46)-(23,64)
(23,46)-(23,64)
(23,47)-(23,54)
(24,4)-(26,47)
(24,15)-(24,17)
(26,14)-(26,28)
(26,14)-(26,40)
(26,29)-(26,30)
(26,31)-(26,35)
*)

(* all spans
(2,14)-(5,62)
(2,16)-(5,62)
(3,2)-(5,62)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,62)
(5,14)-(5,15)
(5,28)-(5,30)
(5,38)-(5,61)
(5,56)-(5,57)
(5,38)-(5,55)
(5,39)-(5,44)
(5,45)-(5,46)
(5,47)-(5,54)
(5,48)-(5,49)
(5,52)-(5,53)
(5,58)-(5,61)
(5,59)-(5,60)
(7,12)-(10,48)
(7,15)-(10,48)
(8,2)-(10,48)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(10,48)
(9,13)-(9,48)
(9,13)-(9,29)
(9,14)-(9,25)
(9,26)-(9,28)
(9,32)-(9,48)
(9,33)-(9,44)
(9,45)-(9,47)
(10,2)-(10,48)
(10,3)-(10,24)
(10,19)-(10,20)
(10,4)-(10,18)
(10,5)-(10,10)
(10,11)-(10,12)
(10,13)-(10,17)
(10,21)-(10,23)
(10,26)-(10,47)
(10,42)-(10,43)
(10,27)-(10,41)
(10,28)-(10,33)
(10,34)-(10,35)
(10,36)-(10,40)
(10,44)-(10,46)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(27,34)
(15,14)-(27,34)
(16,2)-(27,34)
(16,11)-(26,47)
(17,4)-(26,47)
(17,10)-(23,65)
(17,12)-(23,65)
(18,6)-(23,65)
(18,22)-(18,76)
(18,26)-(18,76)
(18,29)-(18,35)
(18,29)-(18,30)
(18,33)-(18,35)
(18,41)-(18,42)
(18,48)-(18,76)
(18,49)-(18,65)
(18,49)-(18,56)
(18,57)-(18,65)
(18,58)-(18,59)
(18,62)-(18,64)
(18,67)-(18,75)
(18,67)-(18,68)
(18,73)-(18,75)
(19,6)-(23,65)
(19,12)-(19,13)
(21,10)-(23,65)
(21,17)-(21,18)
(22,18)-(22,54)
(22,28)-(22,39)
(22,28)-(22,35)
(22,29)-(22,30)
(22,33)-(22,34)
(22,38)-(22,39)
(22,43)-(22,54)
(22,43)-(22,50)
(22,51)-(22,54)
(23,21)-(23,64)
(23,31)-(23,42)
(23,31)-(23,38)
(23,32)-(23,33)
(23,36)-(23,37)
(23,41)-(23,42)
(23,46)-(23,64)
(23,46)-(23,59)
(23,47)-(23,54)
(23,55)-(23,58)
(23,63)-(23,64)
(24,4)-(26,47)
(24,15)-(24,17)
(25,4)-(26,47)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,47)
(26,14)-(26,40)
(26,14)-(26,28)
(26,29)-(26,30)
(26,31)-(26,35)
(26,36)-(26,40)
(26,44)-(26,47)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)