
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ ("],[" ^ (pad @ l2))
  else (let pad = clone 0 (- sizDif) in (pad @ l1) ^ ("],[" ^ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,60)
EMPTY
EmptyG

(7,38)-(7,39)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,41)-(7,46)
EMPTY
EmptyG

(7,47)-(7,48)
EMPTY
EmptyG

(7,49)-(7,59)
EMPTY
EmptyG

(8,40)-(8,65)
EMPTY
EmptyG

(8,51)-(8,52)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,53)-(8,65)
EMPTY
EmptyG

(8,54)-(8,59)
EMPTY
EmptyG

(8,60)-(8,61)
EMPTY
EmptyG

*)
