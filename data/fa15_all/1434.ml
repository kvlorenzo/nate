
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand with
    | (0,2) -> buildX ()
    | (3,5) -> buildY ()
    | (6,10) -> buildSine (build (rand, (depth - 1)))
    | (11,18) -> buildCosine (build (rand, (depth - 1)))
  else ();;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 4) with
    | 0 -> buildSine (build (rand, (depth - 1)))
    | 1 -> buildCosine (build (rand, (depth - 1)))
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(22,4)-(26,56)
EMPTY
EmptyG

(22,10)-(22,14)
EMPTY
EmptyG

(23,15)-(23,21)
EMPTY
EmptyG

(23,15)-(23,24)
EMPTY
EmptyG

(23,22)-(23,24)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(24,15)-(24,21)
EMPTY
EmptyG

(24,22)-(24,24)
rand
VarG

(25,16)-(25,53)
(0 , 4)
TupleG (fromList [LitG])

(27,7)-(27,9)
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)
