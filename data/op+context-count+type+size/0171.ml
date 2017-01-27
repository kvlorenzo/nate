
let rec clone x n =
  let aux acc n = if n <= 0 then acc else clone (List.append [x] acc) (n - 1) in
  aux [] n;;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

*)

(* changed spans
(3,3)-(4,11)
(3,43)-(3,48)
*)

(* type error slice
(2,4)-(4,13)
(2,15)-(4,11)
(2,17)-(4,11)
(3,3)-(4,11)
(3,11)-(3,77)
(3,15)-(3,77)
(3,19)-(3,77)
(3,22)-(3,23)
(3,22)-(3,28)
(3,27)-(3,28)
(3,34)-(3,37)
(3,43)-(3,48)
(3,43)-(3,77)
(3,50)-(3,61)
(3,50)-(3,69)
(3,62)-(3,65)
(3,63)-(3,64)
(3,66)-(3,69)
(3,72)-(3,77)
(4,3)-(4,6)
(4,3)-(4,11)
(4,7)-(4,9)
(4,10)-(4,11)
*)