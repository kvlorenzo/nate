
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (bottom_mult,total) = a in
    match bottom_mult with
    | [] -> total
    | h::t ->
        let newTotal = mulByDigit h x in
        let updateTotal = bigAdd newTotal total in (t, updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (upper_mult,total) = a in
    let newTotal = mulByDigit x upper_mult in
    let updateTotal = bigAdd newTotal total in
    ((upper_mult @ [0]), updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,52)-(29,53)
(29,55)-(29,56)
(48,5)-(52,67)
(48,11)-(48,22)
(49,13)-(49,18)
(51,35)-(51,36)
(52,9)-(52,67)
(52,53)-(52,54)
(52,56)-(52,67)
*)

(* type error slice
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(2,58)-(2,63)
(4,4)-(14,20)
(4,13)-(14,17)
(4,16)-(14,17)
(5,3)-(14,17)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(7,5)-(8,48)
(7,14)-(7,47)
(8,5)-(8,48)
(8,18)-(8,23)
(8,18)-(8,27)
(8,24)-(8,25)
(8,26)-(8,27)
(8,32)-(8,34)
(8,32)-(8,48)
(8,37)-(8,43)
(8,37)-(8,48)
(8,44)-(8,45)
(8,46)-(8,48)
(17,3)-(17,71)
(17,52)-(17,62)
(17,52)-(17,64)
(17,63)-(17,64)
(19,4)-(31,48)
(19,12)-(31,43)
(19,15)-(31,43)
(20,3)-(31,43)
(20,12)-(30,52)
(21,5)-(30,52)
(21,11)-(27,34)
(21,13)-(27,34)
(22,7)-(27,34)
(22,27)-(22,28)
(23,7)-(27,34)
(23,25)-(23,26)
(24,7)-(27,34)
(25,7)-(27,34)
(26,13)-(26,14)
(26,13)-(26,41)
(26,17)-(26,22)
(26,17)-(26,41)
(26,23)-(26,24)
(26,25)-(26,41)
(26,26)-(26,40)
(28,5)-(30,52)
(28,17)-(28,18)
(28,17)-(28,22)
(28,20)-(28,22)
(29,5)-(30,52)
(29,17)-(29,25)
(29,17)-(29,45)
(29,17)-(29,58)
(29,27)-(29,39)
(29,27)-(29,45)
(29,40)-(29,42)
(29,43)-(29,45)
(29,48)-(29,49)
(29,50)-(29,58)
(29,52)-(29,53)
(29,52)-(29,56)
(29,55)-(29,56)
(30,5)-(30,52)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
(30,49)-(30,52)
(31,3)-(31,13)
(31,3)-(31,43)
(31,15)-(31,23)
(31,15)-(31,43)
(31,25)-(31,28)
(31,25)-(31,43)
(31,30)-(31,37)
(31,30)-(31,43)
(31,38)-(31,40)
(31,41)-(31,43)
(33,4)-(43,32)
(33,16)-(43,29)
(33,18)-(43,29)
(34,3)-(43,29)
(36,5)-(42,71)
(39,24)-(39,29)
(39,28)-(39,29)
(40,9)-(42,71)
(40,23)-(40,37)
(41,9)-(42,71)
(41,25)-(41,48)
(42,9)-(42,71)
(42,17)-(42,25)
(42,17)-(42,27)
(42,26)-(42,27)
(42,32)-(42,37)
(42,32)-(42,60)
(42,38)-(42,39)
(42,40)-(42,41)
(42,42)-(42,50)
(42,51)-(42,60)
(42,52)-(42,59)
(43,3)-(43,13)
(43,3)-(43,29)
(43,15)-(43,20)
(43,15)-(43,29)
(43,21)-(43,22)
(43,23)-(43,24)
(43,25)-(43,26)
(43,27)-(43,29)
(46,3)-(54,67)
(46,9)-(52,67)
(46,11)-(52,67)
(47,5)-(52,67)
(47,31)-(47,32)
(48,5)-(52,67)
(49,13)-(49,18)
(51,9)-(52,67)
(51,24)-(51,34)
(51,24)-(51,38)
(51,35)-(51,36)
(51,37)-(51,38)
(52,9)-(52,67)
(52,27)-(52,33)
(52,27)-(52,48)
(52,34)-(52,42)
(52,43)-(52,48)
(52,53)-(52,54)
(52,53)-(52,67)
(52,56)-(52,67)
(53,3)-(54,67)
(53,15)-(53,17)
(53,15)-(53,21)
(53,19)-(53,21)
(54,3)-(54,67)
(54,14)-(54,16)
(54,34)-(54,48)
(54,34)-(54,60)
(54,49)-(54,50)
(54,51)-(54,55)
(54,56)-(54,60)
*)
