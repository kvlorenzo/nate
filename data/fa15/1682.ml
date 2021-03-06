
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then 0
    else (let x = n mod 10
          and r = n / 10 in (digitsOfInt r) @ [x]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then []
    else (let x = n mod 10
          and r = n / 10 in (digitsOfInt r) @ [x]);;

*)

(* changed spans
(7,9)-(7,10)
*)

(* type error slice
(6,4)-(9,50)
(7,9)-(7,10)
(8,9)-(9,50)
(9,28)-(9,49)
(9,44)-(9,45)
*)

(* all spans
(2,20)-(9,50)
(3,2)-(9,50)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(6,4)-(9,50)
(6,7)-(6,12)
(6,7)-(6,8)
(6,11)-(6,12)
(7,9)-(7,10)
(8,9)-(9,50)
(8,18)-(8,26)
(8,18)-(8,19)
(8,24)-(8,26)
(9,18)-(9,24)
(9,18)-(9,19)
(9,22)-(9,24)
(9,28)-(9,49)
(9,44)-(9,45)
(9,28)-(9,43)
(9,29)-(9,40)
(9,41)-(9,42)
(9,46)-(9,49)
(9,47)-(9,48)
*)
