
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) * (eval (b, x, y))) / 2
  | Cosine a -> cos pi
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(16,19)-(16,54)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,21)-(17,58)
(eval (a , x , y) *. eval (b , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(17,22)-(17,38)
eval (a , x , y) *. eval (b , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,61)-(17,62)
2.0
LitG

(18,20)-(18,22)
(**)
VarG

(18,20)-(18,22)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(19,14)-(19,17)
eval
VarG

(19,14)-(19,17)
a
VarG

(19,14)-(19,17)
x
VarG

(19,14)-(19,17)
y
VarG

(19,14)-(19,17)
sin (pi ** eval (a , x , y))
AppG [AppG [EmptyG,EmptyG]]

(19,14)-(19,17)
(a , x , y)
TupleG [VarG,VarG,VarG]

(19,18)-(19,41)
pi ** eval (a , x , y)
AppG [VarG,AppG [EmptyG]]

(19,19)-(19,21)
(**)
VarG

*)
