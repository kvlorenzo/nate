
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a, (a + x)) in
    let base = 0 in
    let args = 1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,5)-(25,68)
(23,11)-(23,27)
(23,13)-(23,27)
(23,18)-(23,19)
(23,18)-(23,27)
(23,22)-(23,23)
(23,22)-(23,27)
(23,26)-(23,27)
(24,5)-(25,68)
(25,5)-(25,68)
(25,16)-(25,17)
(25,21)-(25,68)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
(25,57)-(25,61)
(25,65)-(25,68)
(26,3)-(26,33)
*)

(* type error slice
(23,5)-(25,68)
(23,11)-(23,27)
(23,13)-(23,27)
(23,18)-(23,19)
(23,18)-(23,27)
(23,22)-(23,23)
(23,22)-(23,27)
(23,26)-(23,27)
(24,5)-(25,68)
(24,16)-(24,17)
(25,5)-(25,68)
(25,16)-(25,17)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
(25,57)-(25,61)
*)
