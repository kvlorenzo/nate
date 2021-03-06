
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
  | Sine e' -> sin (pi *. (eval e'))
  | Cosine e' -> cos (pi *. (eval e'))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) *. (eval e2)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1) < (eval e2) then eval e3 else eval e4;;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(17,32)-(17,34)
(18,17)-(18,38)
(18,34)-(18,36)
(19,23)-(19,47)
(19,23)-(19,51)
(19,30)-(19,32)
(19,37)-(19,46)
(19,43)-(19,45)
(19,50)-(19,51)
(20,21)-(20,43)
(20,27)-(20,29)
(20,34)-(20,43)
(20,40)-(20,42)
(22,6)-(22,56)
(22,15)-(22,17)
(22,21)-(22,30)
(22,27)-(22,29)
(22,36)-(22,43)
(22,41)-(22,43)
(22,49)-(22,56)
(22,54)-(22,56)
*)

(* type error slice
(13,3)-(22,58)
(13,14)-(22,56)
(14,2)-(22,56)
(17,15)-(17,18)
(17,15)-(17,36)
(17,26)-(17,35)
(17,27)-(17,31)
(17,32)-(17,34)
(19,23)-(19,47)
(19,23)-(19,51)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(22,56)
(14,2)-(22,56)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,15)-(17,36)
(17,15)-(17,18)
(17,19)-(17,36)
(17,20)-(17,22)
(17,26)-(17,35)
(17,27)-(17,31)
(17,32)-(17,34)
(18,17)-(18,38)
(18,17)-(18,20)
(18,21)-(18,38)
(18,22)-(18,24)
(18,28)-(18,37)
(18,29)-(18,33)
(18,34)-(18,36)
(19,23)-(19,51)
(19,23)-(19,47)
(19,24)-(19,33)
(19,25)-(19,29)
(19,30)-(19,32)
(19,37)-(19,46)
(19,38)-(19,42)
(19,43)-(19,45)
(19,50)-(19,51)
(20,21)-(20,43)
(20,21)-(20,30)
(20,22)-(20,26)
(20,27)-(20,29)
(20,34)-(20,43)
(20,35)-(20,39)
(20,40)-(20,42)
(22,6)-(22,56)
(22,9)-(22,30)
(22,9)-(22,18)
(22,10)-(22,14)
(22,15)-(22,17)
(22,21)-(22,30)
(22,22)-(22,26)
(22,27)-(22,29)
(22,36)-(22,43)
(22,36)-(22,40)
(22,41)-(22,43)
(22,49)-(22,56)
(22,49)-(22,53)
(22,54)-(22,56)
*)
