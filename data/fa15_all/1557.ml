
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then wwhile (f, h1) else h1;;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

*)

(* changed spans
(3,2)-(3,70)
EMPTY
EmptyG

(3,8)-(3,14)
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(3,9)-(3,10)
f b
AppG (fromList [VarG])

*)
