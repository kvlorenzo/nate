
let rec clone x n = match n with | 0 -> [] | 1 -> [clone x (n - 1); x];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,20)-(2,70)
match n with
| 0 -> []
| _ -> clone x (n - 1) @ [x]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(2,50)-(2,70)
EMPTY
EmptyG

(2,51)-(2,56)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,68)-(2,69)
[x]
ListG VarG Nothing

*)
