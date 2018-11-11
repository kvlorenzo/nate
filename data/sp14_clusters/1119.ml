
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Average (x',y') -> ((eval x') + (eval y')) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(12,2)-(15,50)
match e with
| Average (x' , y') -> (x +. y) /. 2.0
CaseG VarG [(Nothing,BopG EmptyG EmptyG)]

(13,13)-(13,14)
x +. y
BopG VarG VarG

(13,13)-(13,14)
(x +. y) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(15,49)-(15,50)
2.0
LitG

*)
