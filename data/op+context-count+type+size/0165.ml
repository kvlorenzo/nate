
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) - (eval (e2, x, y))) - (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | SquareRoot e' -> sqrt (eval (e', x, y))
  | DivideByOne (e1,e2,e3) ->
      1.0 /. (((eval (e1, x, y)) -. (eval (e2, x, y))) -. (eval (e3, x, y)));;

*)

(* changed spans
(29,17)-(29,31)
(29,17)-(29,51)
(29,17)-(29,72)
*)

(* type error slice
(16,3)-(29,72)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(29,7)-(29,72)
(29,17)-(29,21)
(29,17)-(29,31)
(29,17)-(29,51)
(29,17)-(29,72)
(29,23)-(29,25)
(29,23)-(29,31)
(29,27)-(29,28)
(29,30)-(29,31)
(29,37)-(29,41)
(29,37)-(29,51)
(29,43)-(29,45)
(29,43)-(29,51)
(29,47)-(29,48)
(29,50)-(29,51)
(29,58)-(29,62)
(29,58)-(29,72)
(29,64)-(29,66)
(29,64)-(29,72)
(29,68)-(29,69)
(29,71)-(29,72)
*)