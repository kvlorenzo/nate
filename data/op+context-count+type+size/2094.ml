
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence help n) else 0;;


(* fix

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence (help n)) else 0;;

*)

(* changed spans
(5,22)-(5,48)
(5,42)-(5,46)
*)

(* type error slice
(2,46)-(2,50)
(2,46)-(2,58)
(2,52)-(2,58)
(4,4)-(5,58)
(4,29)-(5,56)
(5,3)-(5,56)
(5,6)-(5,7)
(5,6)-(5,11)
(5,10)-(5,11)
(5,17)-(5,48)
(5,22)-(5,41)
(5,22)-(5,48)
(5,42)-(5,46)
(5,47)-(5,48)
*)