
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else (append digitsOfInt (n / 10) n) mod 10;;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,26)-(5,57)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,26)-(5,64)
EMPTY
EmptyG

(5,34)-(5,45)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,55)-(5,56)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
