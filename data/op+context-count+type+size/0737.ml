
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in (asd3, ((padZero asd3 asd2) :: b))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,33)-(25,37)
(25,33)-(25,64)
(25,41)-(25,64)
(25,54)-(25,58)
(26,13)-(26,14)
*)

(* type error slice
(2,4)-(6,19)
(2,15)-(6,17)
(2,17)-(6,17)
(3,3)-(6,17)
(3,15)-(3,17)
(4,3)-(6,17)
(5,30)-(5,36)
(5,30)-(5,56)
(5,38)-(5,48)
(5,51)-(5,56)
(6,3)-(6,9)
(6,3)-(6,17)
(6,10)-(6,15)
(6,16)-(6,17)
(8,4)-(12,78)
(8,13)-(12,75)
(8,16)-(12,75)
(9,3)-(12,75)
(9,17)-(9,28)
(9,17)-(9,31)
(9,29)-(9,31)
(9,35)-(9,46)
(9,35)-(9,49)
(9,47)-(9,49)
(10,3)-(12,75)
(11,10)-(11,21)
(11,10)-(11,42)
(11,10)-(11,47)
(11,23)-(11,28)
(11,23)-(11,37)
(11,29)-(11,30)
(11,32)-(11,37)
(11,40)-(11,42)
(11,45)-(11,47)
(24,9)-(25,64)
(24,21)-(24,39)
(25,9)-(25,64)
(25,20)-(25,28)
(25,41)-(25,48)
(25,41)-(25,58)
(25,49)-(25,53)
(25,54)-(25,58)
*)