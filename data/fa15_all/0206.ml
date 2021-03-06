
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1 / (sin (pi *. (eval (e1, x, y))))) *
         (cos (pi *. (eval (e1, x, y)))))
        * (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1 / (sin (pi *. (eval (e1, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1.0 /. (sin (pi *. (eval (e1, x, y))))) *.
         (cos (pi *. (eval (e1, x, y)))))
        *. (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1.0 /. (sin (pi *. (eval (e1, x, y))));;

*)

(* changed spans
(28,6)-(29,41)
EMPTY
EmptyG

(28,6)-(30,41)
EMPTY
EmptyG

(28,7)-(28,44)
EMPTY
EmptyG

(28,8)-(28,9)
((1.0 /. sin (pi *. eval (e1 , x , y))) *. cos (pi *. eval (e1 , x , y))) *. sin (pi *. eval (e1 , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(28,12)-(28,43)
(1.0 /. sin (pi *. eval (e1 , x , y))) *. cos (pi *. eval (e1 , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,17)-(31,18)
1.0 /. sin (pi *. eval (e1 , x , y))
BopG LitG (AppG (fromList [EmptyG]))

(31,17)-(31,52)
EMPTY
EmptyG

(31,21)-(31,52)
1.0
LitG

*)
