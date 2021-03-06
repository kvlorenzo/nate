
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
  match rand depth with
  | (r,depth) ->
      (match r (0, 6) with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (r, (depth - 1)))
       | 3 -> buildCosine (build (r, (depth - 1)))
       | 4 ->
           buildAverage ((build (r, (depth - 1))), (build (r, (depth - 1))))
       | 5 -> buildTimes ((build (r, (depth - 1))), (build (r, (depth - 1))))
       | 6 ->
           buildThresh
             ((build (r, (depth - 1))), (build (r, (depth - 1))),
               (build (r, (depth - 1))), (build (r, (depth - 1)))));;


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
  match (rand, depth) with
  | (r,0) -> if (r (0, 1)) = 0 then buildX () else buildY ()
  | (r,depth) ->
      let r = rand (0, 7) in
      (match r with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (rand, (depth - 1)))
       | 3 -> buildCosine (build (rand, (depth - 1)))
       | 4 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(26,2)-(39,67)
EMPTY
EmptyG

(26,8)-(26,12)
(rand , depth)
TupleG (fromList [VarG])

(26,8)-(26,18)
match (rand , depth) with
| (r , 0) -> if r (0 , 1) = 0
             then buildX ()
             else buildY ()
| (r , depth) -> (let r =
                    rand (0 , 7) in
                  match r with
                  | 0 -> buildX ()
                  | 1 -> buildY ()
                  | 2 -> buildSine (build (rand , depth - 1))
                  | 3 -> buildCosine (build (rand , depth - 1))
                  | 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
                  | 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
                  | _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(28,6)-(39,67)
if r (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(28,13)-(28,21)
r (0 , 1) = 0
BopG (AppG (fromList [EmptyG])) LitG

(28,19)-(28,20)
1
LitG

(29,14)-(29,23)
0
LitG

(31,14)-(31,23)
match r with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(31,14)-(31,48)
let r = rand (0 , 7) in
match r with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(31,32)-(31,33)
rand
VarG

(32,34)-(32,35)
rand
VarG

(34,33)-(34,34)
rand
VarG

(34,59)-(34,60)
rand
VarG

(35,34)-(35,35)
rand
VarG

(35,60)-(35,61)
rand
VarG

(38,22)-(38,23)
rand
VarG

(38,48)-(38,49)
rand
VarG

(39,23)-(39,24)
rand
VarG

(39,49)-(39,50)
rand
VarG

*)
