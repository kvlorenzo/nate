
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi * (eval (expr, x, y)))
  | Cosine expr -> cos (pi * (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) + (eval (expr2, x, y))) / 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) * (eval (expr2, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(17,21)-(17,47)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,23)-(18,49)
pi *. eval (expr , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(20,6)-(20,51)
(eval (expr1 , x , y) +. eval (expr2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(20,6)-(20,55)
EMPTY
EmptyG

(20,7)-(20,27)
eval (expr1 , x , y) +. eval (expr2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,54)-(20,55)
EMPTY
EmptyG

(21,27)-(21,47)
eval (expr1 , x , y) *. eval (expr2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(21,27)-(21,70)
2.0
LitG

*)
