
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
  | Sine u -> pi
  | Cosine u -> cos (pi *. (eval u))
  | Average (u,v) -> ((eval u) +. (eval v)) /. 2
  | Times (u,v) -> (eval u) *. (eval v)
  | Thresh (s,t,u,v) -> if (eval s) < (eval t) then eval u else eval v;;


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
  | Sine u -> pi *. (eval (u, x, y))
  | Cosine u -> cos (pi *. (eval (u, x, y)))
  | Average (u,v) -> ((eval (u, x, y)) +. (eval (v, x, y))) /. 2.0
  | Times (u,v) -> (eval (u, x, y)) *. (eval (v, x, y))
  | Thresh (s,t,u,v) ->
      if (eval (s, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (v, x, y);;

*)

(* changed spans
(17,15)-(17,17)
(18,17)-(18,20)
(18,34)-(18,35)
(19,24)-(19,49)
(19,29)-(19,30)
(19,36)-(19,42)
(19,41)-(19,42)
(19,48)-(19,49)
(20,21)-(20,39)
(20,26)-(20,27)
(20,33)-(20,37)
(20,33)-(20,39)
(20,38)-(20,39)
(21,29)-(21,33)
(21,29)-(21,35)
(21,29)-(21,46)
(21,34)-(21,35)
(21,40)-(21,44)
(21,40)-(21,46)
(21,45)-(21,46)
(21,53)-(21,57)
(21,53)-(21,59)
(21,58)-(21,59)
(21,65)-(21,69)
(21,65)-(21,71)
(21,70)-(21,71)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(21,73)
(13,15)-(21,71)
(14,3)-(21,71)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,15)-(17,17)
(18,29)-(18,33)
(18,29)-(18,35)
(18,34)-(18,35)
(19,24)-(19,49)
(19,48)-(19,49)
*)