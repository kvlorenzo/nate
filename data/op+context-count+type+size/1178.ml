
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitalRoot n = if n < 10 then n else digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(8,21)-(8,60)
(8,25)-(8,60)
(8,28)-(8,29)
(8,28)-(8,34)
(8,32)-(8,34)
(8,40)-(8,41)
(8,47)-(8,58)
(8,47)-(8,60)
(8,59)-(8,60)
*)

(* type error slice
(6,47)-(6,58)
(6,47)-(6,66)
(6,60)-(6,66)
(8,25)-(8,60)
(8,28)-(8,29)
(8,28)-(8,34)
(8,32)-(8,34)
(8,40)-(8,41)
(8,47)-(8,58)
(8,47)-(8,60)
(8,59)-(8,60)
*)