
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
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ (("*" (exprToString t2)) ^ ")"))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;


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
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ ("*" ^ ((exprToString t2) ^ ")")))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;

*)

(* changed spans
(20,34)-(20,57)
EMPTY
EmptyG

(20,39)-(20,56)
exprToString t2 ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
