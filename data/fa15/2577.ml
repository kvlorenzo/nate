
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) + (eval (b, x, y))) / 2
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


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
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(11,14)-(23,25)
(12,2)-(23,25)
(12,11)-(12,16)
(16,18)-(16,41)
(17,20)-(17,43)
(18,21)-(18,58)
(18,21)-(18,62)
(18,22)-(18,38)
(18,61)-(18,62)
(19,19)-(19,35)
(19,19)-(19,54)
*)

(* type error slice
(12,2)-(23,25)
(12,11)-(12,16)
(16,14)-(16,17)
(16,14)-(16,41)
(16,18)-(16,41)
(16,19)-(16,21)
(17,16)-(17,19)
(17,16)-(17,43)
(17,20)-(17,43)
(17,21)-(17,23)
*)

(* all spans
(11,14)-(23,25)
(12,2)-(23,25)
(12,11)-(12,16)
(13,2)-(23,25)
(13,8)-(13,9)
(14,13)-(14,14)
(15,13)-(15,14)
(16,14)-(16,41)
(16,14)-(16,17)
(16,18)-(16,41)
(16,19)-(16,21)
(16,24)-(16,40)
(16,25)-(16,29)
(16,30)-(16,39)
(16,31)-(16,32)
(16,34)-(16,35)
(16,37)-(16,38)
(17,16)-(17,43)
(17,16)-(17,19)
(17,20)-(17,43)
(17,21)-(17,23)
(17,26)-(17,42)
(17,27)-(17,31)
(17,32)-(17,41)
(17,33)-(17,34)
(17,36)-(17,37)
(17,39)-(17,40)
(18,21)-(18,62)
(18,21)-(18,58)
(18,22)-(18,38)
(18,23)-(18,27)
(18,28)-(18,37)
(18,29)-(18,30)
(18,32)-(18,33)
(18,35)-(18,36)
(18,41)-(18,57)
(18,42)-(18,46)
(18,47)-(18,56)
(18,48)-(18,49)
(18,51)-(18,52)
(18,54)-(18,55)
(18,61)-(18,62)
(19,19)-(19,54)
(19,19)-(19,35)
(19,20)-(19,24)
(19,25)-(19,34)
(19,26)-(19,27)
(19,29)-(19,30)
(19,32)-(19,33)
(19,38)-(19,54)
(19,39)-(19,43)
(19,44)-(19,53)
(19,45)-(19,46)
(19,48)-(19,49)
(19,51)-(19,52)
(21,6)-(23,25)
(21,9)-(21,44)
(21,9)-(21,25)
(21,10)-(21,14)
(21,15)-(21,24)
(21,16)-(21,17)
(21,19)-(21,20)
(21,22)-(21,23)
(21,28)-(21,44)
(21,29)-(21,33)
(21,34)-(21,43)
(21,35)-(21,36)
(21,38)-(21,39)
(21,41)-(21,42)
(22,11)-(22,25)
(22,11)-(22,15)
(22,16)-(22,25)
(22,17)-(22,18)
(22,20)-(22,21)
(22,23)-(22,24)
(23,11)-(23,25)
(23,11)-(23,15)
(23,16)-(23,25)
(23,17)-(23,18)
(23,20)-(23,21)
(23,23)-(23,24)
*)
