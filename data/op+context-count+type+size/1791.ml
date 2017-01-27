
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then ((prod mod 10) :: ((prod / 10) + (mulByDigit i t))) :: t
      else (prod mod 10) :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else (prod mod 10) :: t;;

*)

(* changed spans
(8,14)-(8,60)
(8,32)-(8,60)
(8,67)-(8,68)
*)

(* type error slice
(2,4)-(9,32)
(2,20)-(9,30)
(2,22)-(9,30)
(3,3)-(9,30)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(4,11)-(4,13)
(6,18)-(6,23)
(6,22)-(6,23)
(7,7)-(9,30)
(8,14)-(8,25)
(8,14)-(8,60)
(8,14)-(8,68)
(8,32)-(8,60)
(8,46)-(8,56)
(8,46)-(8,60)
(8,57)-(8,58)
(8,59)-(8,60)
(8,67)-(8,68)
(9,13)-(9,30)
*)
