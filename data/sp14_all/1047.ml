
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
  let expChooser (r,d) =
    match r with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 2 -> buildSine (build (rand, (d - 1)))
    | 3 -> buildCosine (build (rand, (d - 1)))
    | 4 -> buildAverage ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 5 -> buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (d - 1))), (build (rand, (d - 1))),
            (build (rand, (d - 1))), (build (rand, (d - 1)))) in
  if depth < 1 then expChooser rand (0, 2) else expChooser rand (2, 7);;


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
  let num = if depth < 1 then rand (0, 2) else rand (2, 7) in
  match num with
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
(26,2)-(38,70)
EMPTY
EmptyG

(26,18)-(37,61)
let num =
  if depth < 1
  then rand (0 , 2)
  else rand (2 , 7) in
match num with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(27,4)-(37,61)
if depth < 1
then rand (0 , 2)
else rand (2 , 7)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,10)-(27,11)
num
VarG

(30,36)-(30,37)
depth
VarG

(31,38)-(31,39)
depth
VarG

(32,40)-(32,41)
depth
VarG

(32,65)-(32,66)
depth
VarG

(33,38)-(33,39)
depth
VarG

(33,63)-(33,64)
depth
VarG

(36,26)-(36,27)
depth
VarG

(36,51)-(36,52)
depth
VarG

(37,27)-(37,28)
depth
VarG

(37,52)-(37,53)
EMPTY
EmptyG

(37,56)-(37,57)
EMPTY
EmptyG

(38,2)-(38,70)
EMPTY
EmptyG

(38,5)-(38,14)
EMPTY
EmptyG

(38,20)-(38,30)
EMPTY
EmptyG

(38,20)-(38,42)
EMPTY
EmptyG

(38,31)-(38,35)
EMPTY
EmptyG

(38,36)-(38,42)
EMPTY
EmptyG

(38,37)-(38,38)
EMPTY
EmptyG

(38,40)-(38,41)
EMPTY
EmptyG

(38,48)-(38,58)
EMPTY
EmptyG

(38,48)-(38,70)
EMPTY
EmptyG

(38,59)-(38,63)
EMPTY
EmptyG

(38,64)-(38,70)
EMPTY
EmptyG

(38,65)-(38,66)
EMPTY
EmptyG

(38,68)-(38,69)
EMPTY
EmptyG

*)
