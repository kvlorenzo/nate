
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit m) :: t) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,6)-(6,27)
EMPTY
EmptyG

(6,7)-(6,21)
mulByDigit i (m :: t)
AppG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(6,19)-(6,20)
m :: t
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
