
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      sqrt (abs_float (1.0 -. ((eval (circ1, x, y)) ** 2.0)))
  | Oscillate m4 ->
      let x = eval (m4, x, y) in
      x /. (sqrt (((eval (m4, x, y)) ** 2) +. (x ** 2)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Circ of expr* expr
  | Oscillate of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y)
  | Circ (circ1,circ2) ->
      sqrt (abs_float (1.0 -. ((eval (circ1, x, y)) ** 2.0)))
  | Oscillate m4 ->
      let x = eval (m4, x, y) in
      x /. (sqrt (((eval (m4, x, y)) ** 2.0) +. (x ** 2.0)));;

*)

(* changed spans
(31,40)-(31,41)
(31,52)-(31,53)
*)

(* type error slice
(31,18)-(31,42)
(31,37)-(31,39)
(31,40)-(31,41)
(31,46)-(31,54)
(31,49)-(31,51)
(31,52)-(31,53)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(31,56)
(16,2)-(31,56)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,17)-(19,48)
(19,17)-(19,20)
(19,21)-(19,48)
(19,22)-(19,24)
(19,28)-(19,47)
(19,29)-(19,33)
(19,34)-(19,46)
(19,35)-(19,39)
(19,41)-(19,42)
(19,44)-(19,45)
(20,21)-(20,54)
(20,21)-(20,24)
(20,25)-(20,54)
(20,26)-(20,28)
(20,32)-(20,53)
(20,33)-(20,37)
(20,38)-(20,52)
(20,39)-(20,45)
(20,47)-(20,48)
(20,50)-(20,51)
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
(24,6)-(26,27)
(24,9)-(24,48)
(24,9)-(24,27)
(24,10)-(24,14)
(24,15)-(24,26)
(24,16)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
(24,30)-(24,48)
(24,31)-(24,35)
(24,36)-(24,47)
(24,37)-(24,40)
(24,42)-(24,43)
(24,45)-(24,46)
(25,11)-(25,27)
(25,11)-(25,15)
(25,16)-(25,27)
(25,17)-(25,20)
(25,22)-(25,23)
(25,25)-(25,26)
(26,11)-(26,27)
(26,11)-(26,15)
(26,16)-(26,27)
(26,17)-(26,20)
(26,22)-(26,23)
(26,25)-(26,26)
(28,6)-(28,61)
(28,6)-(28,10)
(28,11)-(28,61)
(28,12)-(28,21)
(28,22)-(28,60)
(28,23)-(28,26)
(28,30)-(28,59)
(28,52)-(28,54)
(28,31)-(28,51)
(28,32)-(28,36)
(28,37)-(28,50)
(28,38)-(28,43)
(28,45)-(28,46)
(28,48)-(28,49)
(28,55)-(28,58)
(30,6)-(31,56)
(30,14)-(30,29)
(30,14)-(30,18)
(30,19)-(30,29)
(30,20)-(30,22)
(30,24)-(30,25)
(30,27)-(30,28)
(31,6)-(31,56)
(31,6)-(31,7)
(31,11)-(31,56)
(31,12)-(31,16)
(31,17)-(31,55)
(31,18)-(31,42)
(31,37)-(31,39)
(31,19)-(31,36)
(31,20)-(31,24)
(31,25)-(31,35)
(31,26)-(31,28)
(31,30)-(31,31)
(31,33)-(31,34)
(31,40)-(31,41)
(31,46)-(31,54)
(31,49)-(31,51)
(31,47)-(31,48)
(31,52)-(31,53)
*)