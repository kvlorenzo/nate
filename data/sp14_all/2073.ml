
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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> exprToString buildThresh (a, b, c, d)
  | Times (a,b) -> exprToString buildTimes (a, b)
  | Average (a,b) -> exprToString buildAverage (a, b)
  | Cosine a -> exprToString buildCosine a
  | Sine a -> exprToString buildSine a
  | VarY  -> exprToString buildY
  | VarX  -> exprToString buildX;;


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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> let e' = buildThresh (a, b, c, d) in exprToString e'
  | Times (a,b) -> let e' = buildTimes (a, b) in exprToString e'
  | Average (a,b) -> let e' = buildAverage (a, b) in exprToString e'
  | Cosine a -> let e' = buildCosine a in exprToString e'
  | Sine a -> let e' = buildSine a in exprToString e'
  | VarY  -> exprToString VarX
  | VarX  -> exprToString VarY;;

*)

(* changed spans
(21,11)-(21,20)
EMPTY
EmptyG

(21,16)-(21,20)
EMPTY
EmptyG

(23,11)-(23,20)
EMPTY
EmptyG

(23,16)-(23,20)
EMPTY
EmptyG

(27,24)-(27,36)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(27,24)-(27,61)
EMPTY
EmptyG

(27,37)-(27,48)
buildThresh (a , b , c , d)
AppG (fromList [TupleG (fromList [EmptyG])])

(28,19)-(28,49)
exprToString e'
AppG (fromList [VarG])

(28,32)-(28,42)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(29,21)-(29,53)
exprToString e'
AppG (fromList [VarG])

(29,34)-(29,46)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(30,16)-(30,42)
exprToString e'
AppG (fromList [VarG])

(30,29)-(30,40)
let e' = buildCosine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(31,14)-(31,38)
exprToString e'
AppG (fromList [VarG])

(31,27)-(31,36)
let e' = buildSine a in
exprToString e'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(32,26)-(32,32)
e'
VarG

(33,26)-(33,32)
VarX
ConAppG Nothing Nothing

*)
