
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | [] -> a
      | h::t ->
          ((((fst h) + (snd h)) / 10), ((((fst h) + (snd h)) mod 10) ::
            (snd a))) in
    let base = (0, []) in
    let args = [((List.combine l1), l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(19,21)
(15,12)-(15,13)
(18,10)-(19,21)
(18,11)-(18,37)
(18,12)-(18,31)
(18,13)-(18,20)
(18,14)-(18,17)
(18,18)-(18,19)
(18,23)-(18,30)
(18,24)-(18,27)
(18,28)-(18,29)
(18,34)-(18,36)
(18,39)-(19,20)
(18,40)-(18,68)
(18,41)-(18,60)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,52)-(18,59)
(18,53)-(18,56)
(18,57)-(18,58)
(18,65)-(18,67)
(19,12)-(19,19)
(19,13)-(19,16)
(19,17)-(19,18)
(20,4)-(22,51)
(20,16)-(20,17)
*)

(* type error slice
(14,4)-(22,51)
(14,10)-(19,21)
(14,12)-(19,21)
(15,6)-(19,21)
(15,6)-(19,21)
(15,12)-(15,13)
(21,4)-(22,51)
(21,15)-(21,40)
(21,15)-(21,40)
(21,16)-(21,39)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(7,70)
(4,15)-(7,70)
(5,2)-(7,70)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(7,70)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(7,70)
(7,3)-(7,35)
(7,30)-(7,31)
(7,4)-(7,29)
(7,5)-(7,10)
(7,11)-(7,12)
(7,13)-(7,28)
(7,14)-(7,19)
(7,22)-(7,27)
(7,32)-(7,34)
(7,37)-(7,69)
(7,64)-(7,65)
(7,38)-(7,63)
(7,39)-(7,44)
(7,45)-(7,46)
(7,47)-(7,62)
(7,48)-(7,53)
(7,56)-(7,61)
(7,66)-(7,68)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(23,34)
(12,14)-(23,34)
(13,2)-(23,34)
(13,11)-(22,51)
(14,4)-(22,51)
(14,10)-(19,21)
(14,12)-(19,21)
(15,6)-(19,21)
(15,12)-(15,13)
(16,14)-(16,15)
(18,10)-(19,21)
(18,11)-(18,37)
(18,12)-(18,31)
(18,13)-(18,20)
(18,14)-(18,17)
(18,18)-(18,19)
(18,23)-(18,30)
(18,24)-(18,27)
(18,28)-(18,29)
(18,34)-(18,36)
(18,39)-(19,20)
(18,40)-(18,68)
(18,41)-(18,60)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,52)-(18,59)
(18,53)-(18,56)
(18,57)-(18,58)
(18,65)-(18,67)
(19,12)-(19,19)
(19,13)-(19,16)
(19,17)-(19,18)
(20,4)-(22,51)
(20,15)-(20,22)
(20,16)-(20,17)
(20,19)-(20,21)
(21,4)-(22,51)
(21,15)-(21,40)
(21,16)-(21,39)
(21,17)-(21,34)
(21,18)-(21,30)
(21,31)-(21,33)
(21,36)-(21,38)
(22,4)-(22,51)
(22,18)-(22,44)
(22,18)-(22,32)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)
