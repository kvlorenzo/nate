
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
  match e with | VarX  -> x | VarY  -> y | Sine e -> sin (pi *. (eval e));;


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
  | Sine e -> sin (pi *. (eval (e, 0.0, 0.0)));;

*)

(* changed spans
(14,70)-(14,71)
*)

(* type error slice
(13,3)-(14,75)
(13,14)-(14,73)
(14,2)-(14,73)
(14,64)-(14,72)
(14,65)-(14,69)
(14,70)-(14,71)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(14,73)
(14,2)-(14,73)
(14,8)-(14,9)
(14,26)-(14,27)
(14,39)-(14,40)
(14,53)-(14,73)
(14,53)-(14,56)
(14,57)-(14,73)
(14,58)-(14,60)
(14,64)-(14,72)
(14,65)-(14,69)
(14,70)-(14,71)
*)
