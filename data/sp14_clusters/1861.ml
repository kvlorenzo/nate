
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
  | Sine e' -> "sin(pi*" ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos(pi*" ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (exprToString e'))
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) *. (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      if (exprToString e1) < (exprToString e2)
      then exprToString e3
      else exprToString e4;;


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
(35,29)-(35,41)
eval
VarG

(35,42)-(35,44)
(e' , x , y)
TupleG [VarG,VarG,VarG]

(36,23)-(36,63)
y
VarG

(36,23)-(36,63)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(36,23)-(36,67)
x
VarG

(36,25)-(36,37)
eval
VarG

(36,38)-(36,40)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(36,45)-(36,62)
x
VarG

(36,45)-(36,62)
y
VarG

(36,46)-(36,58)
eval
VarG

(36,59)-(36,61)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(36,66)-(36,67)
x
VarG

(37,21)-(37,59)
y
VarG

(37,21)-(37,59)
2.0
LitG

(37,22)-(37,34)
eval
VarG

(37,35)-(37,37)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(37,42)-(37,59)
x
VarG

(37,42)-(37,59)
y
VarG

(37,43)-(37,55)
eval
VarG

(37,56)-(37,58)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(39,6)-(41,26)
x
VarG

(39,6)-(41,26)
y
VarG

(39,10)-(39,22)
eval
VarG

(39,23)-(39,25)
(e1 , x , y)
TupleG [VarG,VarG,VarG]

(39,29)-(39,46)
x
VarG

(39,29)-(39,46)
y
VarG

(39,30)-(39,42)
eval
VarG

(39,43)-(39,45)
(e2 , x , y)
TupleG [VarG,VarG,VarG]

(40,11)-(40,23)
eval
VarG

(40,11)-(40,26)
x
VarG

(40,11)-(40,26)
y
VarG

(40,24)-(40,26)
(e3 , x , y)
TupleG [VarG,VarG,VarG]

(41,11)-(41,23)
eval
VarG

(41,11)-(41,26)
x
VarG

(41,11)-(41,26)
y
VarG

(41,24)-(41,26)
(e4 , x , y)
TupleG [VarG,VarG,VarG]

*)
