
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
    let f a x = a + x in
    let base = 0 in
    let args = [l1; l2] in let (_,res) = List.fold_left f base args in res in
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
(23,4)-(25,74)
EMPTY
EmptyG

(23,10)-(23,21)
EMPTY
EmptyG

(23,12)-(23,21)
EMPTY
EmptyG

(23,16)-(23,17)
EMPTY
EmptyG

(23,16)-(23,21)
EMPTY
EmptyG

(23,20)-(23,21)
EMPTY
EmptyG

(24,4)-(25,74)
[0 ; 0 ; 0 ; 0 ; 0]
ListG LitG Nothing

(25,4)-(25,74)
EMPTY
EmptyG

(25,15)-(25,23)
EMPTY
EmptyG

(25,16)-(25,18)
EMPTY
EmptyG

(25,20)-(25,22)
EMPTY
EmptyG

(25,27)-(25,74)
EMPTY
EmptyG

(25,41)-(25,55)
EMPTY
EmptyG

(25,41)-(25,67)
EMPTY
EmptyG

(25,56)-(25,57)
EMPTY
EmptyG

(25,58)-(25,62)
EMPTY
EmptyG

(25,63)-(25,67)
EMPTY
EmptyG

(25,71)-(25,74)
0
LitG

(26,2)-(26,34)
0
LitG

*)
