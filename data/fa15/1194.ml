
let rec wwhile (f,b) = match f b with | (h,t) -> if t = true then f h else b;;


(* fix

let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h;;

*)

(* changed spans
(2,56)-(2,60)
(2,66)-(2,67)
(2,66)-(2,69)
(2,75)-(2,76)
*)

(* type error slice
(2,23)-(2,76)
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
(2,49)-(2,76)
(2,66)-(2,67)
(2,66)-(2,69)
(2,68)-(2,69)
(2,75)-(2,76)
*)

(* all spans
(2,16)-(2,76)
(2,23)-(2,76)
(2,29)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,49)-(2,76)
(2,52)-(2,60)
(2,52)-(2,53)
(2,56)-(2,60)
(2,66)-(2,69)
(2,66)-(2,67)
(2,68)-(2,69)
(2,75)-(2,76)
*)
