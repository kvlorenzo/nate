
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rdm = rand in
  match rdm with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rdm = rand (0, 7) in
  match rdm with
  | 0 -> buildY ()
  | 1 -> buildX ()
  | 2 -> Cosine (build (rand, (depth - 1)))
  | 3 -> Sine (build (rand, (depth - 1)))
  | 4 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,12)-(18,16)
(19,2)-(32,67)
(19,8)-(19,11)
(21,6)-(21,75)
(21,27)-(21,28)
(21,33)-(21,75)
(21,36)-(21,41)
(21,36)-(21,45)
(21,44)-(21,45)
(21,51)-(21,60)
(23,6)-(26,43)
(23,18)-(23,22)
(23,18)-(23,29)
(23,23)-(23,29)
(23,24)-(23,25)
(23,27)-(23,28)
(24,6)-(26,43)
(24,9)-(24,14)
(24,9)-(24,18)
(24,17)-(24,18)
*)

(* type error slice
(18,2)-(32,67)
(18,12)-(18,16)
(19,2)-(32,67)
(19,8)-(19,11)
(21,18)-(21,22)
(21,18)-(21,29)
*)

(* all spans
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(32,67)
(18,2)-(32,67)
(18,12)-(18,16)
(19,2)-(32,67)
(19,8)-(19,11)
(21,6)-(21,75)
(21,18)-(21,29)
(21,18)-(21,22)
(21,23)-(21,29)
(21,24)-(21,25)
(21,27)-(21,28)
(21,33)-(21,75)
(21,36)-(21,45)
(21,36)-(21,41)
(21,44)-(21,45)
(21,51)-(21,60)
(21,51)-(21,57)
(21,58)-(21,60)
(21,66)-(21,75)
(21,66)-(21,72)
(21,73)-(21,75)
(23,6)-(26,43)
(23,18)-(23,29)
(23,18)-(23,22)
(23,23)-(23,29)
(23,24)-(23,25)
(23,27)-(23,28)
(24,6)-(26,43)
(24,9)-(24,18)
(24,9)-(24,14)
(24,17)-(24,18)
(25,11)-(25,45)
(25,18)-(25,45)
(25,19)-(25,24)
(25,25)-(25,44)
(25,26)-(25,30)
(25,32)-(25,43)
(25,33)-(25,38)
(25,41)-(25,42)
(26,11)-(26,43)
(26,16)-(26,43)
(26,17)-(26,22)
(26,23)-(26,42)
(26,24)-(26,28)
(26,30)-(26,41)
(26,31)-(26,36)
(26,39)-(26,40)
(27,9)-(27,75)
(27,18)-(27,45)
(27,19)-(27,24)
(27,25)-(27,44)
(27,26)-(27,30)
(27,32)-(27,43)
(27,33)-(27,38)
(27,41)-(27,42)
(27,47)-(27,74)
(27,48)-(27,53)
(27,54)-(27,73)
(27,55)-(27,59)
(27,61)-(27,72)
(27,62)-(27,67)
(27,70)-(27,71)
(28,9)-(28,73)
(28,16)-(28,43)
(28,17)-(28,22)
(28,23)-(28,42)
(28,24)-(28,28)
(28,30)-(28,41)
(28,31)-(28,36)
(28,39)-(28,40)
(28,45)-(28,72)
(28,46)-(28,51)
(28,52)-(28,71)
(28,53)-(28,57)
(28,59)-(28,70)
(28,60)-(28,65)
(28,68)-(28,69)
(30,6)-(32,67)
(31,9)-(31,36)
(31,10)-(31,15)
(31,16)-(31,35)
(31,17)-(31,21)
(31,23)-(31,34)
(31,24)-(31,29)
(31,32)-(31,33)
(31,38)-(31,65)
(31,39)-(31,44)
(31,45)-(31,64)
(31,46)-(31,50)
(31,52)-(31,63)
(31,53)-(31,58)
(31,61)-(31,62)
(32,10)-(32,37)
(32,11)-(32,16)
(32,17)-(32,36)
(32,18)-(32,22)
(32,24)-(32,35)
(32,25)-(32,30)
(32,33)-(32,34)
(32,39)-(32,66)
(32,40)-(32,45)
(32,46)-(32,65)
(32,47)-(32,51)
(32,53)-(32,64)
(32,54)-(32,59)
(32,62)-(32,63)
*)
