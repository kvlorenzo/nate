
let rec clone x n =
  let rec helper acc n' =
    if n <= 0 then [] else helper ((x :: acc), (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(4,27)-(4,56)
(4,34)-(4,56)
*)

(* type error slice
(3,2)-(5,20)
(3,17)-(4,56)
(4,27)-(4,33)
(4,27)-(4,56)
(4,34)-(4,56)
(4,35)-(4,45)
(4,41)-(4,44)
(5,2)-(5,8)
(5,2)-(5,20)
(5,9)-(5,12)
*)

(* all spans
(2,14)-(5,20)
(2,16)-(5,20)
(3,2)-(5,20)
(3,17)-(4,56)
(3,21)-(4,56)
(4,4)-(4,56)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,21)
(4,27)-(4,56)
(4,27)-(4,33)
(4,34)-(4,56)
(4,35)-(4,45)
(4,36)-(4,37)
(4,41)-(4,44)
(4,47)-(4,55)
(4,48)-(4,50)
(4,53)-(4,54)
(5,2)-(5,20)
(5,2)-(5,8)
(5,9)-(5,12)
(5,10)-(5,11)
(5,13)-(5,20)
(5,14)-(5,15)
(5,18)-(5,19)
*)
