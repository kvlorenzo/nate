
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(26,26)-(26,70)
(26,29)-(26,34)
(26,33)-(26,34)
*)

(* type error slice
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(2,58)-(2,63)
(4,4)-(8,48)
(4,13)-(8,44)
(4,16)-(8,44)
(5,3)-(8,44)
(5,14)-(5,25)
(5,14)-(5,28)
(5,26)-(5,28)
(6,3)-(8,44)
(6,14)-(6,25)
(6,14)-(6,28)
(6,26)-(6,28)
(7,5)-(7,16)
(7,5)-(7,43)
(7,5)-(8,44)
(7,18)-(7,23)
(7,18)-(7,38)
(7,24)-(7,25)
(7,27)-(7,38)
(7,41)-(7,43)
(8,6)-(8,17)
(8,6)-(8,44)
(8,19)-(8,24)
(8,19)-(8,39)
(8,25)-(8,26)
(8,28)-(8,39)
(8,42)-(8,44)
(11,3)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(13,4)-(24,37)
(13,12)-(24,33)
(13,15)-(24,33)
(14,3)-(24,33)
(14,12)-(23,52)
(15,5)-(23,52)
(15,11)-(20,71)
(15,13)-(20,71)
(16,7)-(20,71)
(16,13)-(16,14)
(18,12)-(20,71)
(18,18)-(18,19)
(20,20)-(20,22)
(20,20)-(20,27)
(20,20)-(20,32)
(20,20)-(20,38)
(20,20)-(20,71)
(20,25)-(20,27)
(20,31)-(20,32)
(20,45)-(20,65)
(20,45)-(20,71)
(20,70)-(20,71)
(21,5)-(23,52)
(21,17)-(21,18)
(21,17)-(21,22)
(21,20)-(21,22)
(22,5)-(23,52)
(22,16)-(22,24)
(22,16)-(22,57)
(22,26)-(22,38)
(22,26)-(22,57)
(22,40)-(22,41)
(22,40)-(22,47)
(22,45)-(22,47)
(22,50)-(22,51)
(22,50)-(22,57)
(22,55)-(22,57)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,33)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
(26,26)-(26,70)
(26,40)-(26,46)
(26,40)-(26,70)
(26,47)-(26,48)
*)