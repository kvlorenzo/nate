
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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) * (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;

*)

(* changed spans
(11,22)-(26,75)
(12,3)-(26,75)
(13,14)-(13,17)
(14,14)-(14,17)
(15,16)-(15,25)
(15,16)-(15,52)
(15,26)-(15,27)
(15,30)-(15,42)
(15,30)-(15,45)
(15,30)-(15,52)
(15,43)-(15,45)
(15,47)-(15,48)
(15,49)-(15,52)
(16,18)-(16,27)
(16,18)-(16,54)
(16,28)-(16,29)
(16,32)-(16,44)
(16,32)-(16,47)
(16,32)-(16,54)
(16,45)-(16,47)
(16,49)-(16,50)
(16,51)-(16,54)
(18,7)-(18,11)
(18,7)-(18,71)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,32)
(18,16)-(18,71)
(18,29)-(18,32)
(18,34)-(18,35)
(18,37)-(18,40)
(18,37)-(18,71)
(18,41)-(18,42)
(18,45)-(18,57)
(18,45)-(18,61)
(18,45)-(18,71)
(18,58)-(18,61)
(18,63)-(18,64)
(18,65)-(18,71)
(19,25)-(19,37)
(19,25)-(19,41)
(19,25)-(19,69)
(19,38)-(19,41)
(19,43)-(19,44)
(19,46)-(19,49)
(19,46)-(19,69)
(19,50)-(19,51)
(19,53)-(19,65)
(19,53)-(19,69)
(19,66)-(19,69)
(21,7)-(21,10)
(21,7)-(26,75)
(21,11)-(21,12)
(22,11)-(22,23)
(22,11)-(22,27)
(22,11)-(26,75)
(22,24)-(22,27)
(22,29)-(22,30)
(23,13)-(23,16)
(23,13)-(26,75)
(23,17)-(23,18)
(24,17)-(24,29)
(24,17)-(24,33)
(24,17)-(26,75)
(24,30)-(24,33)
(24,35)-(24,36)
(25,19)-(25,22)
(25,19)-(26,75)
(25,23)-(25,24)
(26,23)-(26,35)
(26,23)-(26,39)
(26,23)-(26,75)
(26,36)-(26,39)
(26,41)-(26,42)
(26,44)-(26,47)
(26,44)-(26,75)
(26,48)-(26,49)
(26,52)-(26,64)
(26,52)-(26,68)
(26,52)-(26,75)
(26,65)-(26,68)
(26,70)-(26,71)
(26,72)-(26,75)
(28,10)-(28,26)
(30,15)-(44,75)
*)

(* type error slice
(12,3)-(26,75)
(15,30)-(15,42)
(15,30)-(15,45)
(15,43)-(15,45)
(31,3)-(44,75)
(32,14)-(32,15)
(34,28)-(34,32)
(34,28)-(34,42)
(34,34)-(34,36)
(34,34)-(34,42)
(34,38)-(34,39)
(34,41)-(34,42)
(37,25)-(37,29)
(37,25)-(37,40)
(37,25)-(37,61)
(37,31)-(37,34)
(37,31)-(37,40)
(37,36)-(37,37)
(37,39)-(37,40)
(37,46)-(37,50)
(37,46)-(37,61)
(37,52)-(37,55)
(37,52)-(37,61)
(37,57)-(37,58)
(37,60)-(37,61)
(39,7)-(39,10)
(39,7)-(44,75)
(39,11)-(39,12)
(40,11)-(40,23)
(40,11)-(40,27)
(40,11)-(44,75)
(40,24)-(40,27)
(40,29)-(40,30)
(41,13)-(41,16)
(41,13)-(44,75)
(41,17)-(41,18)
(42,17)-(42,29)
(42,17)-(42,33)
(42,17)-(44,75)
(42,30)-(42,33)
(42,35)-(42,36)
(43,19)-(43,22)
(43,19)-(44,75)
(43,23)-(43,24)
(44,23)-(44,35)
(44,23)-(44,39)
(44,23)-(44,75)
(44,36)-(44,39)
(44,41)-(44,42)
(44,44)-(44,47)
(44,44)-(44,75)
(44,48)-(44,49)
(44,52)-(44,64)
(44,52)-(44,68)
(44,52)-(44,75)
(44,65)-(44,68)
(44,70)-(44,71)
(44,72)-(44,75)
*)
