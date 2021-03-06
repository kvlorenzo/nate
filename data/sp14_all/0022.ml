
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
    let f a x =
      match a with
      | (carry,result) -> (match x with | (h1::t1,h2::t2) -> (0, [])) in
    let base = (0, []) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(23,4)-(27,74)
EMPTY
EmptyG

(23,10)-(25,69)
EMPTY
EmptyG

(23,12)-(25,69)
EMPTY
EmptyG

(24,6)-(25,69)
EMPTY
EmptyG

(24,12)-(24,13)
EMPTY
EmptyG

(25,26)-(25,69)
EMPTY
EmptyG

(25,33)-(25,34)
EMPTY
EmptyG

(25,61)-(25,68)
[0 ; 0 ; 0 ; 0 ; 0]
ListG LitG Nothing

(25,65)-(25,67)
EMPTY
EmptyG

(26,4)-(27,74)
EMPTY
EmptyG

(26,15)-(26,22)
EMPTY
EmptyG

(26,19)-(26,21)
EMPTY
EmptyG

(27,4)-(27,74)
EMPTY
EmptyG

(27,15)-(27,23)
EMPTY
EmptyG

(27,16)-(27,18)
EMPTY
EmptyG

(27,20)-(27,22)
EMPTY
EmptyG

(27,27)-(27,74)
EMPTY
EmptyG

(27,41)-(27,55)
EMPTY
EmptyG

(27,41)-(27,67)
EMPTY
EmptyG

(27,56)-(27,57)
EMPTY
EmptyG

(27,58)-(27,62)
EMPTY
EmptyG

(27,63)-(27,67)
EMPTY
EmptyG

(27,71)-(27,74)
0
LitG

(28,2)-(28,34)
0
LitG

*)
