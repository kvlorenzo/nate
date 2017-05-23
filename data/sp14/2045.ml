
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | MyExpr of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine m -> "sin(pi*" ^ ((exprToString m) ^ ")")
  | Cosine m -> "cos(pi*" ^ ((exprToString m) ^ ")")
  | Square m -> "(" ^ ((exprToString m) ^ "^2)")
  | Average (m,n) ->
      "((" ^ ((exprToString m) ^ ("+" ^ ((exprToString n) ^ ")/2)")))
  | Times (m,n) -> (exprToString m) ^ ("*" ^ (exprToString n))
  | MyExpr (m,n,o) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              (exprToString ^
                 ("?sqrt(|" ^
                    ((exprToString o) ^
                       ("|)" ^ (":" ^ ("(" ^ ((exprToString o) ^ "/2)")))))))))
  | Thresh (m,n,o,p) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?" ^ ((exprToString o) ^ (":" ^ ((exprToString p) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
  | Average of expr* expr
  | Times of expr* expr
  | MyExpr of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine m -> "sin(pi*" ^ ((exprToString m) ^ ")")
  | Cosine m -> "cos(pi*" ^ ((exprToString m) ^ ")")
  | Square m -> "(" ^ ((exprToString m) ^ "^2)")
  | Average (m,n) ->
      "((" ^ ((exprToString m) ^ ("+" ^ ((exprToString n) ^ ")/2)")))
  | Times (m,n) -> (exprToString m) ^ ("*" ^ (exprToString n))
  | MyExpr (m,n,o) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?sqrt(|" ^
                    ((exprToString o) ^
                       ("|)" ^ (":" ^ ("(" ^ ((exprToString o) ^ "/2)")))))))))
  | Thresh (m,n,o,p) ->
      "(" ^
        ((exprToString m) ^
           ("<" ^
              ((exprToString n) ^
                 ("?" ^ ((exprToString o) ^ (":" ^ ((exprToString p) ^ ")")))))));;

*)

(* changed spans
(27,15)-(27,27)
(28,17)-(30,76)
*)

(* type error slice
(17,27)-(17,43)
(17,28)-(17,40)
(27,14)-(30,77)
(27,15)-(27,27)
(27,28)-(27,29)
*)

(* all spans
(13,21)-(36,81)
(14,2)-(36,81)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,14)-(17,50)
(17,24)-(17,25)
(17,14)-(17,23)
(17,26)-(17,50)
(17,44)-(17,45)
(17,27)-(17,43)
(17,28)-(17,40)
(17,41)-(17,42)
(17,46)-(17,49)
(18,16)-(18,52)
(18,26)-(18,27)
(18,16)-(18,25)
(18,28)-(18,52)
(18,46)-(18,47)
(18,29)-(18,45)
(18,30)-(18,42)
(18,43)-(18,44)
(18,48)-(18,51)
(19,16)-(19,48)
(19,20)-(19,21)
(19,16)-(19,19)
(19,22)-(19,48)
(19,40)-(19,41)
(19,23)-(19,39)
(19,24)-(19,36)
(19,37)-(19,38)
(19,42)-(19,47)
(21,6)-(21,69)
(21,11)-(21,12)
(21,6)-(21,10)
(21,13)-(21,69)
(21,31)-(21,32)
(21,14)-(21,30)
(21,15)-(21,27)
(21,28)-(21,29)
(21,33)-(21,68)
(21,38)-(21,39)
(21,34)-(21,37)
(21,40)-(21,67)
(21,58)-(21,59)
(21,41)-(21,57)
(21,42)-(21,54)
(21,55)-(21,56)
(21,60)-(21,66)
(22,19)-(22,62)
(22,36)-(22,37)
(22,19)-(22,35)
(22,20)-(22,32)
(22,33)-(22,34)
(22,38)-(22,62)
(22,43)-(22,44)
(22,39)-(22,42)
(22,45)-(22,61)
(22,46)-(22,58)
(22,59)-(22,60)
(24,6)-(30,79)
(24,10)-(24,11)
(24,6)-(24,9)
(25,8)-(30,79)
(25,26)-(25,27)
(25,9)-(25,25)
(25,10)-(25,22)
(25,23)-(25,24)
(26,11)-(30,78)
(26,16)-(26,17)
(26,12)-(26,15)
(27,14)-(30,77)
(27,28)-(27,29)
(27,15)-(27,27)
(28,17)-(30,76)
(28,28)-(28,29)
(28,18)-(28,27)
(29,20)-(30,75)
(29,38)-(29,39)
(29,21)-(29,37)
(29,22)-(29,34)
(29,35)-(29,36)
(30,23)-(30,74)
(30,29)-(30,30)
(30,24)-(30,28)
(30,31)-(30,73)
(30,36)-(30,37)
(30,32)-(30,35)
(30,38)-(30,72)
(30,43)-(30,44)
(30,39)-(30,42)
(30,45)-(30,71)
(30,63)-(30,64)
(30,46)-(30,62)
(30,47)-(30,59)
(30,60)-(30,61)
(30,65)-(30,70)
(32,6)-(36,81)
(32,10)-(32,11)
(32,6)-(32,9)
(33,8)-(36,81)
(33,26)-(33,27)
(33,9)-(33,25)
(33,10)-(33,22)
(33,23)-(33,24)
(34,11)-(36,80)
(34,16)-(34,17)
(34,12)-(34,15)
(35,14)-(36,79)
(35,32)-(35,33)
(35,15)-(35,31)
(35,16)-(35,28)
(35,29)-(35,30)
(36,17)-(36,78)
(36,22)-(36,23)
(36,18)-(36,21)
(36,24)-(36,77)
(36,42)-(36,43)
(36,25)-(36,41)
(36,26)-(36,38)
(36,39)-(36,40)
(36,44)-(36,76)
(36,49)-(36,50)
(36,45)-(36,48)
(36,51)-(36,75)
(36,69)-(36,70)
(36,52)-(36,68)
(36,53)-(36,65)
(36,66)-(36,67)
(36,71)-(36,74)
*)