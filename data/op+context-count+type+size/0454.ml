
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
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi * (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) + (eval (i2, x, y))) / 2.0;;


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
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0;;

*)

(* changed spans
(18,22)-(18,41)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,69)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(19,69)
(15,14)-(15,15)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,34)
(17,33)-(17,40)
(17,36)-(17,37)
(17,39)-(17,40)
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
(19,26)-(19,30)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,69)
(19,32)-(19,34)
(19,32)-(19,40)
(19,36)-(19,37)
(19,39)-(19,40)
(19,46)-(19,50)
(19,46)-(19,60)
(19,52)-(19,54)
(19,52)-(19,60)
(19,56)-(19,57)
(19,59)-(19,60)
(19,66)-(19,69)
*)
