
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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2;;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.;;

*)

(* changed spans
(19,67)-(19,68)
*)

(* type error slice
(19,23)-(19,68)
(19,67)-(19,68)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,68)
(14,2)-(19,68)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,42)
(17,14)-(17,17)
(17,18)-(17,42)
(17,19)-(17,21)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,32)-(17,33)
(17,35)-(17,36)
(17,38)-(17,39)
(18,16)-(18,44)
(18,16)-(18,19)
(18,20)-(18,44)
(18,21)-(18,23)
(18,27)-(18,43)
(18,28)-(18,32)
(18,33)-(18,42)
(18,34)-(18,35)
(18,37)-(18,38)
(18,40)-(18,41)
(19,23)-(19,68)
(19,23)-(19,63)
(19,24)-(19,41)
(19,25)-(19,29)
(19,30)-(19,40)
(19,31)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(19,45)-(19,62)
(19,46)-(19,50)
(19,51)-(19,61)
(19,52)-(19,54)
(19,56)-(19,57)
(19,59)-(19,60)
(19,67)-(19,68)
*)