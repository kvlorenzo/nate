
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval e1 x y);;


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
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin x;;

*)

(* changed spans
(12,58)-(12,71)
(12,59)-(12,63)
(12,64)-(12,66)
(12,69)-(12,70)
*)

(* type error slice
(11,3)-(12,73)
(11,14)-(12,71)
(12,2)-(12,71)
(12,58)-(12,71)
(12,59)-(12,63)
(12,64)-(12,66)
*)

(* all spans
(11,14)-(12,71)
(12,2)-(12,71)
(12,8)-(12,9)
(12,26)-(12,27)
(12,39)-(12,40)
(12,54)-(12,71)
(12,54)-(12,57)
(12,58)-(12,71)
(12,59)-(12,63)
(12,64)-(12,66)
(12,67)-(12,68)
(12,69)-(12,70)
*)
