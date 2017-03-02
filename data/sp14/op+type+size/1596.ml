
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
  let newRand = rand (0, 4) in
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (newRand, (depth - 1)))
      else Sine (build (newRand, (depth - 1)))
  | 2 ->
      Average
        ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))))
  | 3 ->
      Times ((build (newRand, (depth - 1))), (build (newRand, (depth - 1))));;


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
  match depth with
  | 0 ->
      let halff = rand (0, 2) in if halff = 0 then buildY () else buildX ()
  | 1 ->
      let halff = rand (0, 2) in
      if halff = 0
      then Cosine (build (rand, (depth - 1)))
      else Sine (build (rand, (depth - 1)))
  | 2 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,2)-(31,76)
(18,16)-(18,20)
(18,16)-(18,27)
(18,21)-(18,27)
(18,22)-(18,23)
(18,25)-(18,26)
(21,6)-(21,75)
(23,6)-(26,46)
(25,26)-(25,33)
(26,24)-(26,31)
(29,17)-(29,24)
(29,49)-(29,56)
(31,21)-(31,28)
(31,53)-(31,60)
*)

(* type error slice
(17,3)-(31,78)
(17,15)-(31,76)
(18,2)-(31,76)
(18,16)-(18,20)
(18,16)-(18,27)
(25,18)-(25,48)
(25,19)-(25,24)
(25,25)-(25,47)
(25,26)-(25,33)
*)

(* all spans
(13,11)-(13,20)
(13,16)-(13,20)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(31,76)
(18,2)-(31,76)
(18,16)-(18,27)
(18,16)-(18,20)
(18,21)-(18,27)
(18,22)-(18,23)
(18,25)-(18,26)
(19,2)-(31,76)
(19,8)-(19,13)
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
(23,6)-(26,46)
(23,18)-(23,29)
(23,18)-(23,22)
(23,23)-(23,29)
(23,24)-(23,25)
(23,27)-(23,28)
(24,6)-(26,46)
(24,9)-(24,18)
(24,9)-(24,14)
(24,17)-(24,18)
(25,11)-(25,48)
(25,18)-(25,48)
(25,19)-(25,24)
(25,25)-(25,47)
(25,26)-(25,33)
(25,35)-(25,46)
(25,36)-(25,41)
(25,44)-(25,45)
(26,11)-(26,46)
(26,16)-(26,46)
(26,17)-(26,22)
(26,23)-(26,45)
(26,24)-(26,31)
(26,33)-(26,44)
(26,34)-(26,39)
(26,42)-(26,43)
(28,6)-(29,72)
(29,9)-(29,39)
(29,10)-(29,15)
(29,16)-(29,38)
(29,17)-(29,24)
(29,26)-(29,37)
(29,27)-(29,32)
(29,35)-(29,36)
(29,41)-(29,71)
(29,42)-(29,47)
(29,48)-(29,70)
(29,49)-(29,56)
(29,58)-(29,69)
(29,59)-(29,64)
(29,67)-(29,68)
(31,6)-(31,76)
(31,13)-(31,43)
(31,14)-(31,19)
(31,20)-(31,42)
(31,21)-(31,28)
(31,30)-(31,41)
(31,31)-(31,36)
(31,39)-(31,40)
(31,45)-(31,75)
(31,46)-(31,51)
(31,52)-(31,74)
(31,53)-(31,60)
(31,62)-(31,73)
(31,63)-(31,68)
(31,71)-(31,72)
*)