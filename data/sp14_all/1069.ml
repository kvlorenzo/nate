
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> ((f x not ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,28)-(4,66)
(fun x ->
   (f x , not (f x = x)) , b)
TupleG (fromList [VarG,LamG EmptyG])

(4,40)-(4,61)
f x
AppG (fromList [VarG])

(4,45)-(4,48)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

*)
