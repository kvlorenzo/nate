
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
  | Sine s -> String.concat ["pi* "; exprToString s];;


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
  | Sine s -> "pi* " ^ (exprToString s);;

*)

(* changed spans
(15,14)-(15,27)
EMPTY
EmptyG

(15,14)-(15,52)
EMPTY
EmptyG

(15,28)-(15,52)
"pi* " ^ exprToString s
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(15,29)-(15,35)
(^)
VarG

*)
