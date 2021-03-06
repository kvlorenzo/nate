
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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> (eval (VarX, a1, a2)) + (eval (VarY, a1, a2));;


(* fix

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
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Average (a1,a2) -> (eval (VarX, x, y)) +. (eval (VarY, x, y));;

*)

(* changed spans
(15,23)-(15,68)
eval (VarX , x , y) +. eval (VarY , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(15,36)-(15,38)
EMPTY
EmptyG

(15,40)-(15,42)
x
VarG

(15,47)-(15,68)
y
VarG

(15,60)-(15,62)
EMPTY
EmptyG

(15,64)-(15,66)
x
VarG

*)
