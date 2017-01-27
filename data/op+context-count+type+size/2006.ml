
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let m = reverseInt n in
     let x = m / 10
     and y = m mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;


(* fix

let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n 0) / 10
     and y = (reverseInt n 0) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;

*)

(* changed spans
(3,51)-(3,53)
(3,58)-(3,60)
(9,6)-(12,60)
(9,14)-(9,24)
(9,14)-(9,26)
(9,25)-(9,26)
(10,14)-(10,15)
(10,18)-(10,20)
(11,14)-(11,15)
(11,20)-(11,22)
*)

(* type error slice
(3,18)-(3,28)
(3,18)-(3,60)
(3,30)-(3,36)
(3,40)-(3,60)
(6,6)-(6,7)
(6,6)-(6,11)
(6,10)-(6,11)
(9,6)-(12,60)
(9,14)-(9,24)
(9,14)-(9,26)
(9,25)-(9,26)
(10,14)-(10,15)
(10,14)-(10,20)
(11,14)-(11,15)
(11,14)-(11,22)
*)