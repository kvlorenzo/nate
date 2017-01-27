
let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence (sumList n);;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(20,37)-(20,38)
*)

(* type error slice
(8,6)-(9,53)
(8,20)-(8,28)
(8,20)-(8,38)
(8,32)-(8,38)
(9,40)-(9,51)
(9,40)-(9,53)
(9,52)-(9,53)
(11,4)-(11,37)
(11,12)-(11,34)
(11,16)-(11,27)
(11,16)-(11,34)
(11,29)-(11,32)
(11,29)-(11,34)
(11,33)-(11,34)
(15,22)-(15,70)
(15,61)-(15,68)
(15,61)-(15,70)
(15,69)-(15,70)
(18,16)-(18,22)
(18,16)-(18,24)
(18,23)-(18,24)
(20,29)-(20,36)
(20,29)-(20,38)
(20,37)-(20,38)
*)
