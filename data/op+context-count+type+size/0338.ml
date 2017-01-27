
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone t (n - 1)) :: h);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,57)
(5,49)-(5,50)
(5,63)-(5,64)
*)

(* type error slice
(2,4)-(5,67)
(2,15)-(5,64)
(2,17)-(5,64)
(3,3)-(5,64)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(4,8)-(4,10)
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,48)
(5,43)-(5,57)
(5,43)-(5,64)
(5,49)-(5,50)
(5,52)-(5,57)
*)