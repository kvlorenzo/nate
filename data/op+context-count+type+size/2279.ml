
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = [(0, 0)] in
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
(14,17)-(14,25)
(14,17)-(14,45)
(14,26)-(14,45)
(15,16)-(15,24)
(15,21)-(15,22)
(16,16)-(16,41)
(16,19)-(16,34)
(16,19)-(16,39)
*)

(* type error slice
(14,5)-(17,52)
(14,11)-(14,45)
(14,13)-(14,45)
(15,5)-(17,52)
(15,16)-(15,24)
(15,18)-(15,19)
(15,18)-(15,22)
(15,21)-(15,22)
(16,5)-(17,52)
(16,16)-(16,41)
(16,19)-(16,31)
(16,19)-(16,34)
(16,19)-(16,39)
(16,32)-(16,34)
(16,37)-(16,39)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
*)