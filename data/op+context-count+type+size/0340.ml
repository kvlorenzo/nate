
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> (clone h) :: (x (n - 1)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,48)
(5,43)-(5,50)
(5,49)-(5,50)
(5,56)-(5,64)
*)

(* type error slice
(3,3)-(5,64)
(4,8)-(4,10)
(5,9)-(5,64)
(5,15)-(5,16)
(5,30)-(5,31)
(5,43)-(5,64)
*)
