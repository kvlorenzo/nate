
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let (c,b) = f 8;;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let (x,y) = f 8;;

let _ =
  let fixpoint (f,b) = let y x = f b in (y, (b = (f b))) in wwhile (y, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(2,6)-(2,50)
EMPTY
EmptyG

(2,10)-(2,50)
EMPTY
EmptyG

(2,19)-(2,26)
EMPTY
EmptyG

(2,19)-(2,30)
EMPTY
EmptyG

(2,20)-(2,21)
EMPTY
EmptyG

(2,24)-(2,25)
EMPTY
EmptyG

(2,29)-(2,30)
EMPTY
EmptyG

(2,34)-(2,50)
EMPTY
EmptyG

(2,35)-(2,37)
EMPTY
EmptyG

(2,39)-(2,49)
EMPTY
EmptyG

(2,40)-(2,42)
EMPTY
EmptyG

(2,45)-(2,48)
EMPTY
EmptyG

(4,12)-(4,13)
EMPTY
EmptyG

(4,12)-(4,15)
EMPTY
EmptyG

(4,14)-(4,15)
EMPTY
EmptyG

(11,12)-(11,13)
EMPTY
EmptyG

(11,12)-(11,15)
EMPTY
EmptyG

(11,14)-(11,15)
EMPTY
EmptyG

(14,2)-(14,73)
EMPTY
EmptyG

(14,33)-(14,36)
(f b , b = f b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(14,40)-(14,56)
EMPTY
EmptyG

(14,41)-(14,42)
EMPTY
EmptyG

*)
