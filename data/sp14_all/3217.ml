
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr
  | TheThing of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFiboPlus (e1,e2) = FiboPlus (e1, e2);;

let buildSine e = Sine e;;

let buildTheThing (e1,e2,e3) = TheThing (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 8) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildFiboPlus
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 8 ->
        buildTheThing
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(50,10)-(52,40)
EMPTY
EmptyG

(50,11)-(50,38)
EMPTY
EmptyG

(50,12)-(50,17)
EMPTY
EmptyG

(50,19)-(50,23)
EMPTY
EmptyG

(50,25)-(50,36)
EMPTY
EmptyG

(50,26)-(50,31)
EMPTY
EmptyG

(50,34)-(50,35)
EMPTY
EmptyG

(51,42)-(51,47)
EMPTY
EmptyG

(51,48)-(51,67)
EMPTY
EmptyG

(51,49)-(51,53)
EMPTY
EmptyG

(51,55)-(51,66)
EMPTY
EmptyG

(51,56)-(51,61)
EMPTY
EmptyG

(51,64)-(51,65)
EMPTY
EmptyG

(52,12)-(52,39)
EMPTY
EmptyG

(52,13)-(52,18)
EMPTY
EmptyG

(52,19)-(52,38)
EMPTY
EmptyG

(52,20)-(52,24)
EMPTY
EmptyG

(52,26)-(52,37)
EMPTY
EmptyG

(52,27)-(52,32)
EMPTY
EmptyG

(52,35)-(52,36)
EMPTY
EmptyG

(54,8)-(56,40)
EMPTY
EmptyG

*)
