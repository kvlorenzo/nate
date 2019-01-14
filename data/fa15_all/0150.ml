
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> 0
  | VarY  -> 1
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(12,2)-(17,67)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> (exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ ("+" ^ exprToString e2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(14,13)-(14,14)
"x"
LitG

(15,15)-(15,30)
"y"
LitG

(17,23)-(17,63)
(exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,24)-(17,41)
(^)
VarG

(17,24)-(17,41)
(^)
VarG

(17,24)-(17,41)
exprToString e1 ^ ("+" ^ exprToString e2)
AppG (fromList [AppG (fromList [EmptyG])])

(17,45)-(17,62)
(^)
VarG

(17,45)-(17,62)
"+" ^ exprToString e2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,45)-(17,62)
"+"
LitG

(17,66)-(17,67)
"/2"
LitG

*)
