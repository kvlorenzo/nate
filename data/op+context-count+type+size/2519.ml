
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with | (c,(d1,d2)::ds) -> ((d1 + (d2 mod 10)), (d1 + d2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,10)-(6,11)
(6,13)-(6,14)
(24,7)-(24,70)
(24,13)-(24,14)
(24,43)-(24,70)
(24,49)-(24,58)
(24,56)-(24,58)
(25,5)-(27,52)
*)

(* type error slice
(6,20)-(6,28)
(6,20)-(6,48)
(6,30)-(6,42)
(6,30)-(6,48)
(8,4)-(11,18)
(8,11)-(11,16)
(8,13)-(11,16)
(9,3)-(11,16)
(9,3)-(11,16)
(9,18)-(10,55)
(9,20)-(10,55)
(9,22)-(10,55)
(10,5)-(10,55)
(10,5)-(10,55)
(10,8)-(10,9)
(10,8)-(10,14)
(10,8)-(10,14)
(10,8)-(10,14)
(10,13)-(10,14)
(10,20)-(10,23)
(10,29)-(10,35)
(10,29)-(10,55)
(10,29)-(10,55)
(10,29)-(10,55)
(10,29)-(10,55)
(10,36)-(10,37)
(10,39)-(10,40)
(10,39)-(10,44)
(10,43)-(10,44)
(10,47)-(10,48)
(10,47)-(10,55)
(10,52)-(10,55)
(11,3)-(11,9)
(11,3)-(11,16)
(11,3)-(11,16)
(11,3)-(11,16)
(11,10)-(11,11)
(11,12)-(11,13)
(11,14)-(11,16)
(13,4)-(16,80)
(13,13)-(16,76)
(13,16)-(16,76)
(14,3)-(16,76)
(14,3)-(16,76)
(14,7)-(14,18)
(14,7)-(14,21)
(14,7)-(14,21)
(14,7)-(14,40)
(14,7)-(14,40)
(14,19)-(14,21)
(14,26)-(14,37)
(14,26)-(14,40)
(14,26)-(14,40)
(14,38)-(14,40)
(15,10)-(15,21)
(15,10)-(15,72)
(15,10)-(15,72)
(15,10)-(15,72)
(15,10)-(15,77)
(15,23)-(15,28)
(15,23)-(15,66)
(15,23)-(15,66)
(15,23)-(15,66)
(15,29)-(15,30)
(15,33)-(15,44)
(15,33)-(15,47)
(15,33)-(15,47)
(15,33)-(15,66)
(15,45)-(15,47)
(15,52)-(15,63)
(15,52)-(15,66)
(15,52)-(15,66)
(15,64)-(15,66)
(15,70)-(15,72)
(15,75)-(15,77)
(16,9)-(16,11)
(16,9)-(16,76)
(16,14)-(16,25)
(16,14)-(16,76)
(16,14)-(16,76)
(16,14)-(16,76)
(16,27)-(16,32)
(16,27)-(16,70)
(16,33)-(16,34)
(16,37)-(16,48)
(16,37)-(16,51)
(16,37)-(16,51)
(16,37)-(16,70)
(16,49)-(16,51)
(16,56)-(16,67)
(16,56)-(16,70)
(16,56)-(16,70)
(16,68)-(16,70)
(16,74)-(16,76)
(18,20)-(19,78)
(19,3)-(19,78)
(19,3)-(19,78)
(19,3)-(19,78)
(19,3)-(19,78)
(19,3)-(19,78)
(19,9)-(19,10)
(19,24)-(19,26)
(19,38)-(19,78)
(19,41)-(19,42)
(19,41)-(19,46)
(19,52)-(19,62)
(19,52)-(19,65)
(21,4)-(28,37)
(21,12)-(28,33)
(21,15)-(28,33)
(22,3)-(28,33)
(22,12)-(27,52)
(23,5)-(27,52)
(23,11)-(24,70)
(23,13)-(24,70)
(24,7)-(24,70)
(24,7)-(24,70)
(24,7)-(24,70)
(24,13)-(24,14)
(24,43)-(24,45)
(24,49)-(24,51)
(25,5)-(27,52)
(25,17)-(25,22)
(25,20)-(25,22)
(26,5)-(27,52)
(26,16)-(26,24)
(26,16)-(26,44)
(26,16)-(26,44)
(26,26)-(26,38)
(26,26)-(26,44)
(26,26)-(26,44)
(26,26)-(26,44)
(26,39)-(26,41)
(26,42)-(26,44)
(27,19)-(27,33)
(27,19)-(27,45)
(27,19)-(27,45)
(27,19)-(27,45)
(27,34)-(27,35)
(27,36)-(27,40)
(27,41)-(27,45)
(28,15)-(28,18)
(28,15)-(28,33)
(28,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,20)-(28,33)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)