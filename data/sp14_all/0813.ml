
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Gauss (e1,e2,e3) ->
      (2.0 *.
         (exp
            (-
               ((((eval (e1, x, y)) -. (eval (e2, x, y))) ** 2.0) /.
                  (eval (e3, x, y))))))
        -. 1.0
  | _ -> failwith "error";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Gauss (e1,e2,e3) ->
      2.0 *.
        (exp
           (-.
              ((((eval (e1, x, y)) -. (eval (e2, x, y))) ** 2.0) /.
                 (eval (e3, x, y)))));;

*)

(* changed spans
(17,2)-(36,25)
match e with
| VarX -> x
| VarY -> y
| Sine e' -> sin (pi *. eval (e' , x , y))
| Cosine e' -> cos (pi *. eval (e' , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
| Thresh (e1 , e2 , e3 , e4) -> if eval (e1 , x , y) < eval (e2 , x , y)
                                then eval (e3 , x , y)
                                else eval (e4 , x , y)
| Sqrt e -> sqrt (abs_float (eval (e , x , y)))
| Gauss (e1 , e2 , e3) -> 2.0 *. exp (-. (((eval (e1 , x , y) -. eval (e2 , x , y)) ** 2.0) /. eval (e3 , x , y)))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(30,6)-(35,14)
EMPTY
EmptyG

(32,12)-(34,37)
(-. (((eval (e1 , x , y) -. eval (e2 , x , y)) ** 2.0) /. eval (e3 , x , y)))
UopG (BopG EmptyG EmptyG)

(35,11)-(35,14)
EMPTY
EmptyG

(36,9)-(36,17)
EMPTY
EmptyG

(36,9)-(36,25)
EMPTY
EmptyG

(36,18)-(36,25)
EMPTY
EmptyG

*)
