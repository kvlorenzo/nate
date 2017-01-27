
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
  | Sine e1 -> sin (pi * (eval (e1, x, y)));;


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
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(11,10)-(11,13)
(11,10)-(11,26)
(11,18)-(11,22)
(11,18)-(11,26)
(11,23)-(11,26)
(17,21)-(17,23)
(17,21)-(17,41)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(17,16)-(17,19)
(17,16)-(17,41)
(17,21)-(17,23)
(17,21)-(17,41)
*)