
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
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      ("(" exprToString var7) ^
        ("<" ^
           ((exprToString var8) ^
              (" ? " ^
                 ((exprToString var9) ^ (" : " ^ ((exprToString var0) ^ ")"))))));;


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
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine var1 -> "sin (pi*" ^ ((exprToString var1) ^ ")")
  | Cosine var2 -> "cos (pi*" ^ ((exprToString var2) ^ ")")
  | Average (var3,var4) ->
      "((" ^ ((exprToString var3) ^ (" + " ^ ((exprToString var4) ^ ")/2)")))
  | Times (var5,var6) -> (exprToString var5) ^ (" * " ^ (exprToString var6))
  | Thresh (var7,var8,var9,var0) ->
      "(" ^
        ((exprToString var7) ^
           ("<" ^
              ((exprToString var8) ^
                 (" ? " ^
                    ((exprToString var9) ^
                       (" : " ^ ((exprToString var0) ^ ")")))))));;

*)

(* changed spans
(21,8)-(21,29)
(21,12)-(21,24)
*)

(* type error slice
(12,3)-(25,76)
(15,33)-(15,45)
(15,33)-(15,50)
(15,46)-(15,50)
(21,8)-(21,11)
(21,8)-(21,29)
(21,12)-(21,24)
(21,25)-(21,29)
*)