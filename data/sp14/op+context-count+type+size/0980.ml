
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        (buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let num = rand (1, 5) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 3) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
      else
        buildTimes
          ((buildCosine (build (rand, (depth - 1)))),
            (build (rand, (depth - 1))))
  | 3 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (build (rand, (depth - 1))));;

*)

(* changed spans
(44,8)-(45,70)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(17,3)-(17,41)
(17,16)-(17,39)
(43,6)-(43,16)
(43,6)-(45,70)
(44,8)-(45,70)
(44,9)-(44,21)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(45,70)
(24,2)-(45,70)
(24,8)-(24,13)
(25,9)-(25,74)
(25,19)-(25,30)
(25,19)-(25,23)
(25,24)-(25,30)
(25,25)-(25,26)
(25,28)-(25,29)
(25,34)-(25,74)
(25,37)-(25,44)
(25,37)-(25,40)
(25,43)-(25,44)
(25,50)-(25,59)
(25,50)-(25,56)
(25,57)-(25,59)
(25,65)-(25,74)
(25,65)-(25,71)
(25,72)-(25,74)
(27,6)-(30,50)
(27,16)-(27,28)
(27,16)-(27,20)
(27,21)-(27,28)
(27,22)-(27,23)
(27,25)-(27,27)
(28,6)-(30,50)
(28,9)-(28,24)
(28,9)-(28,20)
(28,10)-(28,13)
(28,18)-(28,19)
(28,23)-(28,24)
(29,11)-(29,48)
(29,11)-(29,20)
(29,21)-(29,48)
(29,22)-(29,27)
(29,28)-(29,47)
(29,29)-(29,33)
(29,35)-(29,46)
(29,36)-(29,41)
(29,44)-(29,45)
(30,11)-(30,50)
(30,11)-(30,22)
(30,23)-(30,50)
(30,24)-(30,29)
(30,30)-(30,49)
(30,31)-(30,35)
(30,37)-(30,48)
(30,38)-(30,43)
(30,46)-(30,47)
(32,6)-(41,40)
(32,16)-(32,27)
(32,16)-(32,20)
(32,21)-(32,27)
(32,22)-(32,23)
(32,25)-(32,26)
(33,6)-(41,40)
(33,9)-(33,25)
(33,9)-(33,20)
(33,10)-(33,13)
(33,18)-(33,19)
(33,24)-(33,25)
(35,8)-(37,40)
(35,8)-(35,18)
(36,10)-(37,40)
(36,11)-(36,50)
(36,12)-(36,21)
(36,22)-(36,49)
(36,23)-(36,28)
(36,29)-(36,48)
(36,30)-(36,34)
(36,36)-(36,47)
(36,37)-(36,42)
(36,45)-(36,46)
(37,12)-(37,39)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
(39,8)-(41,40)
(39,8)-(39,18)
(40,10)-(41,40)
(40,11)-(40,52)
(40,12)-(40,23)
(40,24)-(40,51)
(40,25)-(40,30)
(40,31)-(40,50)
(40,32)-(40,36)
(40,38)-(40,49)
(40,39)-(40,44)
(40,47)-(40,48)
(41,12)-(41,39)
(41,13)-(41,18)
(41,19)-(41,38)
(41,20)-(41,24)
(41,26)-(41,37)
(41,27)-(41,32)
(41,35)-(41,36)
(43,6)-(45,70)
(43,6)-(43,16)
(44,8)-(45,70)
(44,9)-(44,21)
(45,11)-(45,69)
(45,12)-(45,39)
(45,13)-(45,18)
(45,19)-(45,38)
(45,20)-(45,24)
(45,26)-(45,37)
(45,27)-(45,32)
(45,35)-(45,36)
(45,41)-(45,68)
(45,42)-(45,47)
(45,48)-(45,67)
(45,49)-(45,53)
(45,55)-(45,66)
(45,56)-(45,61)
(45,64)-(45,65)
*)