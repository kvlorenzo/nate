
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildOp1 e = Op1 e;;

let buildOp2 (a,b,a_less,b_less) = Op2 (a, b, a_less);;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth > (-1)
  then
    let randNum = rand (1, 2) in
    let randNum2 = rand (3, 4) in
    (if (randNum = 1) && (randNum2 = 3)
     then buildCosine (buildOp1 (buildX ()))
     else
       if (randNum = 1) && (randNum2 = 4)
       then
         buildSine
           (buildOp2
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                (build (rand, (depth - 1))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Op1 of expr
  | Op2 of expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  if depth = 0 then buildSine (buildX ()) else buildX ();;

*)

(* changed spans
(13,20)-(13,28)
(13,27)-(13,28)
(15,13)-(15,22)
(15,17)-(15,22)
(15,21)-(15,22)
(17,14)-(17,53)
(17,35)-(17,53)
(17,40)-(17,41)
(17,43)-(17,44)
(17,46)-(17,52)
(19,14)-(19,24)
(24,5)-(24,17)
(24,13)-(24,17)
(26,4)-(36,46)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(17,3)-(17,55)
(17,14)-(17,53)
(19,3)-(19,26)
(19,14)-(19,24)
(19,18)-(19,24)
(24,2)-(36,46)
(24,2)-(36,46)
(24,2)-(36,46)
(26,4)-(36,46)
(27,4)-(36,46)
(28,4)-(36,46)
(29,10)-(29,21)
(29,10)-(29,44)
(31,7)-(36,45)
(31,7)-(36,45)
(31,7)-(36,45)
(33,9)-(33,18)
(33,9)-(36,45)
(34,11)-(36,45)
(34,12)-(34,20)
(35,14)-(36,44)
*)

(* all spans
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,13)-(15,22)
(15,17)-(15,22)
(15,21)-(15,22)
(17,14)-(17,53)
(17,35)-(17,53)
(17,40)-(17,41)
(17,43)-(17,44)
(17,46)-(17,52)
(19,14)-(19,24)
(19,18)-(19,24)
(19,23)-(19,24)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(36,46)
(24,2)-(36,46)
(24,5)-(24,17)
(24,5)-(24,10)
(24,13)-(24,17)
(26,4)-(36,46)
(26,18)-(26,29)
(26,18)-(26,22)
(26,23)-(26,29)
(26,24)-(26,25)
(26,27)-(26,28)
(27,4)-(36,46)
(27,19)-(27,30)
(27,19)-(27,23)
(27,24)-(27,30)
(27,25)-(27,26)
(27,28)-(27,29)
(28,4)-(36,46)
(28,8)-(28,39)
(28,8)-(28,21)
(28,9)-(28,16)
(28,19)-(28,20)
(28,25)-(28,39)
(28,26)-(28,34)
(28,37)-(28,38)
(29,10)-(29,44)
(29,10)-(29,21)
(29,22)-(29,44)
(29,23)-(29,31)
(29,32)-(29,43)
(29,33)-(29,39)
(29,40)-(29,42)
(31,7)-(36,45)
(31,10)-(31,41)
(31,10)-(31,23)
(31,11)-(31,18)
(31,21)-(31,22)
(31,27)-(31,41)
(31,28)-(31,36)
(31,39)-(31,40)
(33,9)-(36,45)
(33,9)-(33,18)
(34,11)-(36,45)
(34,12)-(34,20)
(35,14)-(36,44)
(35,15)-(35,42)
(35,16)-(35,21)
(35,22)-(35,41)
(35,23)-(35,27)
(35,29)-(35,40)
(35,30)-(35,35)
(35,38)-(35,39)
(35,44)-(35,71)
(35,45)-(35,50)
(35,51)-(35,70)
(35,52)-(35,56)
(35,58)-(35,69)
(35,59)-(35,64)
(35,67)-(35,68)
(36,16)-(36,43)
(36,17)-(36,22)
(36,23)-(36,42)
(36,24)-(36,28)
(36,30)-(36,41)
(36,31)-(36,36)
(36,39)-(36,40)
(31,7)-(36,45)
(24,2)-(36,46)
*)
