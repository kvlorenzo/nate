
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    if (rand mod 5) = 0
    then buildSine (build (rand, (depth - 1)))
    else
      if (rand mod 5) = 1
      then buildCosine (build (rand, (depth - 1)))
      else
        if (rand mod 5) = 2
        then buildAverage (build (rand, (depth - 1)))
        else
          if (rand mod 5) = 3
          then buildAverage (build (rand, (depth - 1)))
          else
            if (rand mod 5) = 4 then buildThresh (build (rand, (depth - 1)));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(19,12)-(19,21)
(24,6)-(24,15)
(25,9)-(25,58)
(25,13)-(25,17)
(25,13)-(25,23)
(25,13)-(25,28)
(25,22)-(25,23)
(25,27)-(25,28)
(25,49)-(25,55)
(25,49)-(25,58)
(25,56)-(25,58)
(27,5)-(39,74)
(27,9)-(27,19)
(27,9)-(27,24)
(27,18)-(27,19)
(28,10)-(28,44)
(30,7)-(39,74)
(30,11)-(30,15)
(30,11)-(30,21)
(30,11)-(30,26)
(30,20)-(30,21)
(30,25)-(30,26)
(33,9)-(39,74)
(33,13)-(33,17)
(33,13)-(33,23)
(33,13)-(33,28)
(33,22)-(33,23)
(33,27)-(33,28)
(34,28)-(34,51)
(34,50)-(34,51)
(36,11)-(39,74)
(36,15)-(36,19)
(36,15)-(36,25)
(36,15)-(36,30)
(36,24)-(36,25)
(36,29)-(36,30)
(37,16)-(37,28)
(37,16)-(37,53)
(37,30)-(37,53)
(37,52)-(37,53)
(39,13)-(39,74)
(39,17)-(39,21)
(39,17)-(39,27)
(39,17)-(39,32)
(39,26)-(39,27)
(39,31)-(39,32)
(39,38)-(39,74)
(39,51)-(39,74)
(39,73)-(39,74)
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
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(25,13)-(25,17)
(25,13)-(25,23)
(28,21)-(28,26)
(28,21)-(28,44)
(28,28)-(28,32)
(28,28)-(28,44)
(28,35)-(28,44)
(30,7)-(39,74)
(31,12)-(31,23)
(31,12)-(31,48)
(31,25)-(31,30)
(31,25)-(31,48)
(31,32)-(31,36)
(31,32)-(31,48)
(31,39)-(31,48)
(33,9)-(39,74)
(34,14)-(34,26)
(34,14)-(34,51)
(34,28)-(34,33)
(34,28)-(34,51)
(34,35)-(34,39)
(34,35)-(34,51)
(34,42)-(34,51)
(37,16)-(37,28)
(37,16)-(37,53)
(37,30)-(37,35)
(37,30)-(37,53)
(37,37)-(37,41)
(37,37)-(37,53)
(37,44)-(37,53)
(39,38)-(39,49)
(39,38)-(39,74)
(39,51)-(39,56)
(39,51)-(39,74)
(39,58)-(39,62)
(39,58)-(39,74)
(39,65)-(39,74)
*)