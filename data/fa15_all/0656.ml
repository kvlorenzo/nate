
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else digitsOfInt ((n / 10) add [n mod 10]);;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
front :: (add back next)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(6,25)-(6,62)
add (digitsOfInt (n / 10))
    (n mod 10)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,37)-(6,62)
EMPTY
EmptyG

(6,47)-(6,50)
EMPTY
EmptyG

(6,51)-(6,61)
EMPTY
EmptyG

*)
