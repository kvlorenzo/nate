
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
  | Cosine a -> cos (pi * (eval (a, x, y)))
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
(18,22)-(18,24)
(18,22)-(18,41)
(19,20)-(19,22)
(19,20)-(19,39)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(21,15)
(15,25)-(15,29)
(15,25)-(15,38)
(15,31)-(15,32)
(15,31)-(15,38)
(15,34)-(15,35)
(15,37)-(15,38)
(18,17)-(18,20)
(18,17)-(18,41)
(18,22)-(18,24)
(18,22)-(18,41)
(18,28)-(18,32)
(18,28)-(18,41)
(18,34)-(18,35)
(18,34)-(18,41)
(18,37)-(18,38)
(18,40)-(18,41)
(19,15)-(19,18)
(19,15)-(19,39)
(19,20)-(19,22)
(19,20)-(19,39)
(19,26)-(19,30)
(19,26)-(19,39)
(19,32)-(19,33)
(19,32)-(19,39)
(19,35)-(19,36)
(19,38)-(19,39)
*)