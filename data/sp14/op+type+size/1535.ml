
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;


(* fix

let rec clone x n = let acc = [0] in if n > 0 then clone x (n - 1) else [];;

*)

(* changed spans
(3,2)-(3,65)
(3,13)-(3,14)
(3,39)-(3,49)
(3,45)-(3,48)
*)

(* type error slice
(2,3)-(3,67)
(2,14)-(3,65)
(3,33)-(3,38)
(3,33)-(3,57)
(3,39)-(3,49)
(3,39)-(3,49)
(3,40)-(3,41)
*)

(* all spans
(2,14)-(3,65)
(2,16)-(3,65)
(3,2)-(3,65)
(3,12)-(3,15)
(3,13)-(3,14)
(3,19)-(3,65)
(3,22)-(3,27)
(3,22)-(3,23)
(3,26)-(3,27)
(3,33)-(3,57)
(3,33)-(3,38)
(3,39)-(3,49)
(3,40)-(3,41)
(3,45)-(3,48)
(3,50)-(3,57)
(3,51)-(3,52)
(3,55)-(3,56)
(3,63)-(3,65)
*)
