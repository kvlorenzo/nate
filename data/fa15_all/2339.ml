
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(5,50)-(5,61)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,56)-(5,57)
(d , k , t)
TupleG (fromList [VarG])

*)
