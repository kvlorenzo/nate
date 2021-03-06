
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10) (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,24)-(3,57)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,25)-(3,36)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,25)-(3,56)
[]
ListG EmptyG Nothing

(3,46)-(3,56)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
