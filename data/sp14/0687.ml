
let rec mulByDigit i l =
  let comb a (hd::tl) = a + hd in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,14)-(3,30)
(3,24)-(3,30)
*)

(* type error slice
(3,2)-(11,15)
(3,11)-(3,30)
(3,14)-(3,30)
(3,24)-(3,30)
(9,13)-(9,73)
(9,32)-(9,73)
(9,33)-(9,37)
*)

(* all spans
(2,19)-(11,15)
(2,21)-(11,15)
(3,2)-(11,15)
(3,11)-(3,30)
(3,14)-(3,30)
(3,24)-(3,30)
(3,24)-(3,25)
(3,28)-(3,30)
(4,2)-(11,15)
(4,20)-(10,41)
(4,22)-(10,41)
(5,4)-(10,41)
(5,10)-(5,11)
(6,12)-(6,14)
(8,8)-(10,41)
(8,11)-(8,30)
(8,11)-(8,25)
(8,12)-(8,20)
(8,13)-(8,15)
(8,18)-(8,19)
(8,23)-(8,24)
(8,29)-(8,30)
(9,13)-(9,73)
(9,13)-(9,28)
(9,14)-(9,22)
(9,15)-(9,17)
(9,20)-(9,21)
(9,25)-(9,27)
(9,32)-(9,73)
(9,33)-(9,37)
(9,38)-(9,55)
(9,39)-(9,47)
(9,40)-(9,42)
(9,45)-(9,46)
(9,52)-(9,54)
(9,56)-(9,72)
(9,57)-(9,66)
(9,67)-(9,68)
(9,69)-(9,71)
(10,13)-(10,41)
(10,13)-(10,21)
(10,14)-(10,16)
(10,19)-(10,20)
(10,25)-(10,41)
(10,26)-(10,35)
(10,36)-(10,37)
(10,38)-(10,40)
(11,2)-(11,15)
(11,2)-(11,11)
(11,12)-(11,13)
(11,14)-(11,15)
*)
