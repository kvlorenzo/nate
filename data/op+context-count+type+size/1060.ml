
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let case = 0 in
  if depth = 0
  then case = (rand (0, 1))
  else
    (let case = rand (0, 6) in
     match case with
     | 0 -> buildX
     | 1 -> buildY
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let case = rand (0, 6) in
  match case with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,14)-(26,15)
(27,3)-(45,67)
(27,6)-(27,11)
(27,6)-(27,15)
(27,14)-(27,15)
(28,8)-(28,12)
(28,8)-(28,26)
(28,25)-(28,26)
(30,6)-(45,67)
(30,17)-(30,21)
(30,17)-(30,27)
(30,23)-(30,24)
(30,23)-(30,27)
(32,13)-(32,19)
(33,13)-(33,19)
(34,13)-(34,47)
(38,14)-(38,37)
(38,43)-(38,66)
(41,14)-(41,37)
(41,43)-(41,66)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(25,4)-(45,74)
(25,16)-(45,67)
(26,3)-(45,67)
(27,3)-(45,67)
(27,6)-(27,11)
(27,6)-(27,15)
(27,14)-(27,15)
(28,8)-(28,26)
(28,16)-(28,20)
(28,16)-(28,26)
(28,22)-(28,23)
(28,22)-(28,26)
(28,25)-(28,26)
(30,6)-(45,67)
(31,6)-(45,67)
(32,13)-(32,19)
(34,13)-(34,22)
(34,13)-(34,47)
(34,24)-(34,29)
(34,24)-(34,47)
(34,31)-(34,35)
(34,31)-(34,47)
(34,38)-(34,47)
(35,13)-(35,24)
(35,13)-(35,49)
(35,26)-(35,31)
(35,26)-(35,49)
(35,33)-(35,37)
(35,33)-(35,49)
(35,40)-(35,49)
(37,10)-(37,22)
(37,10)-(38,66)
(38,14)-(38,19)
(38,14)-(38,37)
(38,14)-(38,66)
(38,21)-(38,25)
(38,21)-(38,37)
(38,28)-(38,37)
(38,43)-(38,48)
(38,43)-(38,66)
(38,50)-(38,54)
(38,50)-(38,66)
(38,57)-(38,66)
(40,10)-(40,20)
(40,10)-(41,66)
(41,14)-(41,19)
(41,14)-(41,37)
(41,14)-(41,66)
(41,21)-(41,25)
(41,21)-(41,37)
(41,28)-(41,37)
(41,43)-(41,48)
(41,43)-(41,66)
(41,50)-(41,54)
(41,50)-(41,66)
(41,57)-(41,66)
(43,10)-(43,21)
(43,10)-(45,67)
(44,14)-(44,19)
(44,14)-(44,37)
(44,14)-(45,67)
(44,21)-(44,25)
(44,21)-(44,37)
(44,28)-(44,37)
(44,43)-(44,48)
(44,43)-(44,66)
(44,50)-(44,54)
(44,50)-(44,66)
(44,57)-(44,66)
(45,15)-(45,20)
(45,15)-(45,38)
(45,22)-(45,26)
(45,22)-(45,38)
(45,29)-(45,38)
(45,44)-(45,49)
(45,44)-(45,67)
(45,51)-(45,55)
(45,51)-(45,67)
(45,58)-(45,67)
*)