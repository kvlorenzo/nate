
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
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) / 2
  | Times (v,w) -> (eval (v, x, y)) * (eval (w, x, y))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;


(* fix

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
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y));;

*)

(* changed spans
(28,2)-(39,69)
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG)])

(31,18)-(31,41)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(32,20)-(32,43)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(33,21)-(33,58)
(eval (v , x , y) +. eval (w , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(33,22)-(33,38)
eval (v , x , y) +. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(34,19)-(34,35)
eval (v , x , y) *. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(34,19)-(34,54)
2.0
LitG

*)
