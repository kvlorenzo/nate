
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> buildTimes ((eval e1), (eval e2))
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,17)-(11,67)
EMPTY
EmptyG

(11,38)-(11,67)
EMPTY
EmptyG

(11,46)-(11,47)
EMPTY
EmptyG

(11,49)-(11,50)
EMPTY
EmptyG

(11,52)-(11,58)
EMPTY
EmptyG

(11,60)-(11,66)
EMPTY
EmptyG

(13,16)-(13,39)
EMPTY
EmptyG

(13,25)-(13,39)
EMPTY
EmptyG

(13,32)-(13,34)
EMPTY
EmptyG

(13,36)-(13,38)
EMPTY
EmptyG

(24,21)-(24,31)
EMPTY
EmptyG

(24,21)-(24,54)
EMPTY
EmptyG

(24,32)-(24,54)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,39)-(24,41)
(e1 , x , y)
TupleG (fromList [VarG])

(24,44)-(24,53)
y
VarG

(24,50)-(24,52)
(e2 , x , y)
TupleG (fromList [VarG])

(25,28)-(25,39)
EMPTY
EmptyG

(25,28)-(25,56)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(25,40)-(25,56)
eval
VarG

(25,41)-(25,43)
(e1 , x , y)
TupleG (fromList [VarG])

(25,45)-(25,47)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,49)-(25,51)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(25,53)-(25,55)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
