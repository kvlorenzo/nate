
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let this = listReverse n in
  match n with
  | 0 -> []
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let xxx n =
    match n with
    | 0 -> []
    | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10)) in
  listReverse (xxx n);;

*)

(* changed spans
(6,2)-(9,67)
EMPTY
EmptyG

(6,13)-(6,24)
EMPTY
EmptyG

(6,13)-(6,26)
EMPTY
EmptyG

(6,25)-(6,26)
let xxx =
  fun n ->
    match n with
    | 0 -> []
    | n -> if n < 0
           then []
           else (n mod 10) :: (digitsOfInt (n / 10)) in
listReverse (xxx n)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,2)-(9,67)
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)
