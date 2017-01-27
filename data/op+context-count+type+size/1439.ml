
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
  | Sine a -> sin (eval (e, x, a))
  | Cosine a -> cos (pi *. y);;


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
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (pi *. y);;

*)

(* changed spans
(17,26)-(17,27)
(17,29)-(17,30)
(18,17)-(18,29)
*)

(* type error slice
(13,4)-(18,32)
(13,15)-(18,29)
(14,3)-(18,29)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,20)-(17,24)
(17,20)-(17,33)
(17,26)-(17,27)
(17,26)-(17,33)
(17,29)-(17,30)
(17,32)-(17,33)
(18,22)-(18,29)
(18,28)-(18,29)
*)
