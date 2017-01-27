
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = x in
      let (l1',l2') = a in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,25)-(14,26)
(15,7)-(17,44)
(16,20)-(16,38)
*)

(* type error slice
(13,5)-(20,52)
(13,11)-(17,44)
(13,13)-(17,44)
(14,7)-(17,44)
(14,25)-(14,26)
(15,7)-(17,44)
(15,23)-(15,24)
(16,7)-(17,44)
(17,9)-(17,19)
(17,9)-(17,44)
(17,24)-(17,44)
(18,5)-(20,52)
(18,17)-(18,18)
(18,17)-(18,22)
(18,20)-(18,22)
(19,5)-(20,52)
(19,16)-(19,28)
(19,16)-(19,34)
(19,29)-(19,31)
(19,32)-(19,34)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
*)
