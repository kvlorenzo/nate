
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr
  | ArcSin of expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) +. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)))
  | ArcSin (x1,x2) -> (asin ((eval (x1, x, y)) ** 2)) /. 1.6;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr
  | ArcSin of expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) +. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)))
  | ArcSin (x1,x2) -> (asin ((eval (x1, x, y)) ** 2.)) /. 1.6;;

*)

(* changed spans
(32,51)-(32,52)
*)

(* type error slice
(18,3)-(32,61)
(21,28)-(21,32)
(21,28)-(21,42)
(21,34)-(21,36)
(21,34)-(21,42)
(21,38)-(21,39)
(21,41)-(21,42)
(32,31)-(32,35)
(32,31)-(32,45)
(32,31)-(32,52)
(32,37)-(32,39)
(32,37)-(32,45)
(32,41)-(32,42)
(32,44)-(32,45)
(32,48)-(32,50)
(32,51)-(32,52)
*)