
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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (("^" exprToString y) ^ ")")))));;


(* fix

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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))));;

*)

(* changed spans
(24,44)-(24,47)
(24,44)-(24,62)
(24,48)-(24,60)
*)

(* type error slice
(12,3)-(24,69)
(15,29)-(15,41)
(15,29)-(15,43)
(15,42)-(15,43)
(24,44)-(24,47)
(24,44)-(24,62)
(24,48)-(24,60)
(24,61)-(24,62)
*)