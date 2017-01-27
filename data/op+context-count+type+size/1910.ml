
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x1,x2) ->
      "((" ^ ((exprToString x1) ^ ("+" ^ ((exprToString x2) ^ ")/2)")))
  | Times (x1,x2) -> (exprToString x1) ^ ("*" ^ (exprToString x2))
  | Thresh (x1,x2,x3,x4) ->
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))));;

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
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))));;


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
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y);;

*)

(* changed spans
(11,22)-(26,73)
(12,3)-(26,73)
(12,9)-(12,10)
(13,14)-(13,17)
(14,14)-(14,17)
(15,15)-(15,24)
(15,15)-(15,50)
(15,25)-(15,26)
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,50)
(15,42)-(15,43)
(15,45)-(15,46)
(15,47)-(15,50)
(16,17)-(16,26)
(16,17)-(16,52)
(16,27)-(16,28)
(16,31)-(16,43)
(16,31)-(16,52)
(16,44)-(16,45)
(16,47)-(16,48)
(16,49)-(16,52)
(18,7)-(18,11)
(18,7)-(18,69)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,31)
(18,16)-(18,69)
(18,29)-(18,31)
(18,33)-(18,34)
(18,36)-(18,39)
(18,36)-(18,69)
(18,40)-(18,41)
(18,44)-(18,56)
(18,44)-(18,59)
(18,44)-(18,69)
(18,57)-(18,59)
(18,61)-(18,62)
(18,63)-(18,69)
(19,23)-(19,35)
(19,23)-(19,38)
(19,23)-(19,65)
(19,36)-(19,38)
(19,40)-(19,41)
(19,43)-(19,46)
(19,43)-(19,65)
(19,47)-(19,48)
(19,50)-(19,62)
(19,50)-(19,65)
(19,63)-(19,65)
(21,7)-(21,10)
(21,7)-(26,73)
(21,11)-(21,12)
(22,11)-(22,23)
(22,11)-(22,26)
(22,11)-(26,73)
(22,24)-(22,26)
(22,28)-(22,29)
(23,13)-(23,16)
(23,13)-(26,73)
(23,17)-(23,18)
(24,17)-(24,29)
(24,17)-(24,32)
(24,17)-(26,73)
(24,30)-(24,32)
(24,34)-(24,35)
(25,19)-(25,22)
(25,19)-(26,73)
(25,23)-(25,24)
(26,23)-(26,35)
(26,23)-(26,38)
(26,23)-(26,73)
(26,36)-(26,38)
(26,40)-(26,41)
(26,43)-(26,46)
(26,43)-(26,73)
(26,47)-(26,48)
(26,51)-(26,63)
(26,51)-(26,66)
(26,51)-(26,73)
(26,64)-(26,66)
(26,68)-(26,69)
(26,70)-(26,73)
(28,10)-(28,26)
(30,15)-(44,73)
*)

(* type error slice
(12,3)-(26,73)
(15,29)-(15,41)
(15,29)-(15,43)
(15,42)-(15,43)
(31,3)-(44,73)
(32,14)-(32,15)
(39,7)-(39,10)
(39,7)-(44,73)
(39,11)-(39,12)
(40,11)-(40,23)
(40,11)-(40,26)
(40,11)-(44,73)
(40,24)-(40,26)
(40,28)-(40,29)
(41,13)-(41,16)
(41,13)-(44,73)
(41,17)-(41,18)
(42,17)-(42,29)
(42,17)-(42,32)
(42,17)-(44,73)
(42,30)-(42,32)
(42,34)-(42,35)
(43,19)-(43,22)
(43,19)-(44,73)
(43,23)-(43,24)
(44,23)-(44,35)
(44,23)-(44,38)
(44,23)-(44,73)
(44,36)-(44,38)
(44,40)-(44,41)
(44,43)-(44,46)
(44,43)-(44,73)
(44,47)-(44,48)
(44,51)-(44,63)
(44,51)-(44,66)
(44,51)-(44,73)
(44,64)-(44,66)
(44,68)-(44,69)
(44,70)-(44,73)
*)