
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
  | 0 -> let num = rand (1, 10) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 30) in
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
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        (buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;


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
  | 0 -> let num = rand (1, 10) in if num > 3 then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | 2 ->
      let num = rand (1, 30) in
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
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;

*)

(* changed spans
(75,8)-(76,70)
(77,9)-(77,14)
(77,23)-(77,28)
(77,31)-(77,32)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(17,3)-(17,41)
(17,16)-(17,39)
(74,6)-(74,16)
(74,6)-(76,70)
(75,8)-(76,70)
(75,9)-(75,21)
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
(23,15)-(77,34)
(24,2)-(77,34)
(24,8)-(24,13)
(25,9)-(25,75)
(25,19)-(25,31)
(25,19)-(25,23)
(25,24)-(25,31)
(25,25)-(25,26)
(25,28)-(25,30)
(25,35)-(25,75)
(25,38)-(25,45)
(25,38)-(25,41)
(25,44)-(25,45)
(25,51)-(25,60)
(25,51)-(25,57)
(25,58)-(25,60)
(25,66)-(25,75)
(25,66)-(25,72)
(25,73)-(25,75)
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
(32,16)-(32,28)
(32,16)-(32,20)
(32,21)-(32,28)
(32,22)-(32,23)
(32,25)-(32,27)
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
(43,6)-(54,52)
(43,16)-(43,28)
(43,16)-(43,20)
(43,21)-(43,28)
(43,22)-(43,23)
(43,25)-(43,27)
(44,6)-(54,52)
(44,9)-(44,24)
(44,9)-(44,20)
(44,10)-(44,13)
(44,18)-(44,19)
(44,23)-(44,24)
(46,8)-(49,54)
(46,8)-(46,18)
(47,10)-(49,54)
(47,11)-(48,73)
(47,12)-(47,24)
(48,14)-(48,72)
(48,15)-(48,42)
(48,16)-(48,21)
(48,22)-(48,41)
(48,23)-(48,27)
(48,29)-(48,40)
(48,30)-(48,35)
(48,38)-(48,39)
(48,44)-(48,71)
(48,45)-(48,50)
(48,51)-(48,70)
(48,52)-(48,56)
(48,58)-(48,69)
(48,59)-(48,64)
(48,67)-(48,68)
(49,12)-(49,53)
(49,13)-(49,24)
(49,25)-(49,52)
(49,26)-(49,31)
(49,32)-(49,51)
(49,33)-(49,37)
(49,39)-(49,50)
(49,40)-(49,45)
(49,48)-(49,49)
(51,8)-(54,52)
(51,8)-(51,18)
(52,10)-(54,52)
(52,11)-(53,73)
(52,12)-(52,24)
(53,14)-(53,72)
(53,15)-(53,42)
(53,16)-(53,21)
(53,22)-(53,41)
(53,23)-(53,27)
(53,29)-(53,40)
(53,30)-(53,35)
(53,38)-(53,39)
(53,44)-(53,71)
(53,45)-(53,50)
(53,51)-(53,70)
(53,52)-(53,56)
(53,58)-(53,69)
(53,59)-(53,64)
(53,67)-(53,68)
(54,12)-(54,51)
(54,13)-(54,22)
(54,23)-(54,50)
(54,24)-(54,29)
(54,30)-(54,49)
(54,31)-(54,35)
(54,37)-(54,48)
(54,38)-(54,43)
(54,46)-(54,47)
(56,6)-(56,75)
(56,6)-(56,16)
(56,17)-(56,75)
(56,18)-(56,45)
(56,19)-(56,24)
(56,25)-(56,44)
(56,26)-(56,30)
(56,32)-(56,43)
(56,33)-(56,38)
(56,41)-(56,42)
(56,47)-(56,74)
(56,48)-(56,53)
(56,54)-(56,73)
(56,55)-(56,59)
(56,61)-(56,72)
(56,62)-(56,67)
(56,70)-(56,71)
(58,6)-(68,66)
(58,16)-(58,28)
(58,16)-(58,20)
(58,21)-(58,28)
(58,22)-(58,23)
(58,25)-(58,27)
(59,6)-(68,66)
(59,9)-(59,16)
(59,9)-(59,12)
(59,15)-(59,16)
(60,11)-(60,72)
(60,11)-(60,20)
(60,21)-(60,72)
(60,22)-(60,31)
(60,32)-(60,71)
(60,33)-(60,42)
(60,43)-(60,70)
(60,44)-(60,49)
(60,50)-(60,69)
(60,51)-(60,55)
(60,57)-(60,68)
(60,58)-(60,63)
(60,66)-(60,67)
(62,8)-(68,66)
(62,11)-(62,18)
(62,11)-(62,14)
(62,17)-(62,18)
(64,10)-(64,77)
(64,10)-(64,21)
(64,22)-(64,77)
(64,23)-(64,34)
(64,35)-(64,76)
(64,36)-(64,47)
(64,48)-(64,75)
(64,49)-(64,54)
(64,55)-(64,74)
(64,56)-(64,60)
(64,62)-(64,73)
(64,63)-(64,68)
(64,71)-(64,72)
(66,10)-(68,66)
(66,13)-(66,20)
(66,13)-(66,16)
(66,19)-(66,20)
(67,15)-(67,66)
(67,15)-(67,24)
(67,25)-(67,66)
(67,26)-(67,37)
(67,38)-(67,65)
(67,39)-(67,44)
(67,45)-(67,64)
(67,46)-(67,50)
(67,52)-(67,63)
(67,53)-(67,58)
(67,61)-(67,62)
(68,15)-(68,66)
(68,15)-(68,26)
(68,27)-(68,66)
(68,28)-(68,37)
(68,38)-(68,65)
(68,39)-(68,44)
(68,45)-(68,64)
(68,46)-(68,50)
(68,52)-(68,63)
(68,53)-(68,58)
(68,61)-(68,62)
(70,6)-(70,77)
(70,6)-(70,18)
(70,19)-(70,77)
(70,20)-(70,47)
(70,21)-(70,26)
(70,27)-(70,46)
(70,28)-(70,32)
(70,34)-(70,45)
(70,35)-(70,40)
(70,43)-(70,44)
(70,49)-(70,76)
(70,50)-(70,55)
(70,56)-(70,75)
(70,57)-(70,61)
(70,63)-(70,74)
(70,64)-(70,69)
(70,72)-(70,73)
(72,6)-(72,75)
(72,6)-(72,16)
(72,17)-(72,75)
(72,18)-(72,45)
(72,19)-(72,24)
(72,25)-(72,44)
(72,26)-(72,30)
(72,32)-(72,43)
(72,33)-(72,38)
(72,41)-(72,42)
(72,47)-(72,74)
(72,48)-(72,53)
(72,54)-(72,73)
(72,55)-(72,59)
(72,61)-(72,72)
(72,62)-(72,67)
(72,70)-(72,71)
(74,6)-(76,70)
(74,6)-(74,16)
(75,8)-(76,70)
(75,9)-(75,21)
(76,11)-(76,69)
(76,12)-(76,39)
(76,13)-(76,18)
(76,19)-(76,38)
(76,20)-(76,24)
(76,26)-(76,37)
(76,27)-(76,32)
(76,35)-(76,36)
(76,41)-(76,68)
(76,42)-(76,47)
(76,48)-(76,67)
(76,49)-(76,53)
(76,55)-(76,66)
(76,56)-(76,61)
(76,64)-(76,65)
(77,9)-(77,34)
(77,9)-(77,14)
(77,15)-(77,34)
(77,16)-(77,20)
(77,22)-(77,33)
(77,23)-(77,28)
(77,31)-(77,32)
*)
