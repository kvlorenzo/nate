
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,24)-(2,40)
let l = [] in
if n < 0 then l else l
LetG NonRec (fromList [ListG EmptyG Nothing]) (IteG EmptyG EmptyG EmptyG)

(2,38)-(2,40)
EMPTY
EmptyG

*)
