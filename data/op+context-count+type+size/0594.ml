
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,18)
(23,17)-(23,22)
(24,5)-(25,69)
(24,16)-(24,18)
(25,5)-(25,69)
(25,16)-(25,18)
(25,22)-(25,69)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
(25,53)-(25,57)
(25,58)-(25,62)
(25,66)-(25,69)
(26,3)-(26,13)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(23,5)-(25,69)
(23,11)-(23,22)
(23,13)-(23,22)
(23,17)-(23,18)
(23,17)-(23,22)
(23,21)-(23,22)
(24,5)-(25,69)
(24,16)-(24,18)
(25,5)-(25,69)
(25,16)-(25,18)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
(25,53)-(25,57)
(25,58)-(25,62)
*)