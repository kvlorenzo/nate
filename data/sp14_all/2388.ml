
let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then (digitsOfIntHelper (n / 10) (n mod 10)) :: result
    else result in
  digitsOfIntHelper n [];;


(* fix

let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then digitsOfIntHelper (n / 10) ((n mod 10) :: result)
    else result in
  digitsOfIntHelper n [];;

*)

(* changed spans
(5,9)-(5,58)
EMPTY
EmptyG

(5,37)-(5,47)
(n mod 10) :: result
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
