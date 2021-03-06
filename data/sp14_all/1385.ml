
let rec clone x n =
  if n <= 0
  then []
  else (match x with | [] -> x | h::t -> [clone t (n - 1); h]);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(5,7)-(5,62)
EMPTY
EmptyG

(5,14)-(5,15)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(5,41)-(5,61)
EMPTY
EmptyG

(5,48)-(5,49)
x
VarG

(5,59)-(5,60)
EMPTY
EmptyG

*)
