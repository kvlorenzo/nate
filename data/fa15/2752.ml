
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder x y] @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(4,6)-(4,32)
(4,10)-(4,18)
(4,10)-(4,32)
(4,19)-(4,32)
(6,8)-(6,17)
(6,9)-(6,10)
(6,12)-(6,13)
(6,15)-(6,16)
(11,23)-(11,24)
(11,25)-(11,26)
(11,30)-(11,46)
*)

(* type error slice
(2,3)-(2,64)
(2,14)-(2,62)
(2,23)-(2,30)
(2,24)-(2,25)
(4,3)-(4,34)
(4,6)-(4,32)
(11,13)-(11,22)
(11,13)-(11,26)
(11,23)-(11,24)
*)

(* all spans
(2,14)-(2,62)
(2,16)-(2,62)
(2,20)-(2,62)
(2,23)-(2,35)
(2,23)-(2,30)
(2,24)-(2,25)
(2,28)-(2,29)
(2,33)-(2,35)
(2,41)-(2,55)
(2,41)-(2,48)
(2,42)-(2,43)
(2,46)-(2,47)
(2,53)-(2,55)
(2,61)-(2,62)
(4,6)-(4,32)
(4,10)-(4,32)
(4,10)-(4,18)
(4,19)-(4,32)
(6,8)-(6,17)
(6,9)-(6,10)
(6,12)-(6,13)
(6,15)-(6,16)
(8,19)-(11,46)
(8,21)-(11,46)
(9,2)-(11,46)
(9,8)-(9,18)
(9,8)-(9,16)
(9,17)-(9,18)
(10,10)-(10,12)
(11,12)-(11,46)
(11,28)-(11,29)
(11,12)-(11,27)
(11,13)-(11,26)
(11,13)-(11,22)
(11,23)-(11,24)
(11,25)-(11,26)
(11,30)-(11,46)
(11,31)-(11,41)
(11,42)-(11,43)
(11,44)-(11,45)
*)