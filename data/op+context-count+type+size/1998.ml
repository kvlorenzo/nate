
let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> [listReverse tail; head];;


(* fix

let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail);;

*)

(* changed spans
(20,19)-(20,43)
(20,20)-(20,36)
(20,38)-(20,42)
*)

(* type error slice
(16,4)-(20,45)
(16,21)-(20,43)
(17,3)-(20,43)
(17,9)-(17,10)
(18,11)-(18,13)
(20,20)-(20,31)
(20,20)-(20,36)
(20,32)-(20,36)
*)