
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Boring of expr* expr
  | SumTan of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Boring (e1,e2) -> 3 *. ((eval (e1, x, y)) +. (4 *. (eval (e2, x, y))))
  | SumTan (e1,e2,e3) ->
      ((tan (eval (e1, x, y))) +. (tan (eval (e2, x, y)))) +.
        (tan (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Boring of expr* expr
  | SumTan of expr* expr* expr;;

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
      else eval (e4, x, y)
  | Boring (e1,e2) -> 3. *. ((eval (e1, x, y)) +. (4. *. (eval (e2, x, y))))
  | SumTan (e1,e2,e3) ->
      ((tan (eval (e1, x, y))) +. (tan (eval (e2, x, y)))) +.
        (tan (eval (e3, x, y)));;

*)

(* changed spans
(27,22)-(27,23)
(27,50)-(27,51)
*)

(* type error slice
(27,22)-(27,23)
(27,22)-(27,74)
(27,49)-(27,73)
(27,50)-(27,51)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(30,31)
(16,2)-(30,31)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,15)-(19,44)
(19,15)-(19,18)
(19,19)-(19,44)
(19,20)-(19,22)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(19,33)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,17)-(20,46)
(20,17)-(20,20)
(20,21)-(20,46)
(20,22)-(20,24)
(20,28)-(20,45)
(20,29)-(20,33)
(20,34)-(20,44)
(20,35)-(20,37)
(20,39)-(20,40)
(20,42)-(20,43)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,22)-(27,74)
(27,22)-(27,23)
(27,27)-(27,74)
(27,28)-(27,45)
(27,29)-(27,33)
(27,34)-(27,44)
(27,35)-(27,37)
(27,39)-(27,40)
(27,42)-(27,43)
(27,49)-(27,73)
(27,50)-(27,51)
(27,55)-(27,72)
(27,56)-(27,60)
(27,61)-(27,71)
(27,62)-(27,64)
(27,66)-(27,67)
(27,69)-(27,70)
(29,6)-(30,31)
(29,6)-(29,58)
(29,7)-(29,30)
(29,8)-(29,11)
(29,12)-(29,29)
(29,13)-(29,17)
(29,18)-(29,28)
(29,19)-(29,21)
(29,23)-(29,24)
(29,26)-(29,27)
(29,34)-(29,57)
(29,35)-(29,38)
(29,39)-(29,56)
(29,40)-(29,44)
(29,45)-(29,55)
(29,46)-(29,48)
(29,50)-(29,51)
(29,53)-(29,54)
(30,8)-(30,31)
(30,9)-(30,12)
(30,13)-(30,30)
(30,14)-(30,18)
(30,19)-(30,29)
(30,20)-(30,22)
(30,24)-(30,25)
(30,27)-(30,28)
*)