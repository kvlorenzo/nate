
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let a = List.length l1 in let b = List.length l2 in if 1 < 2 then clone 0 1;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

*)

(* changed spans
(9,2)-(9,77)
let (a , b) =
  (List.length l1 , List.length l2) in
if a < b
then (List.append (clone 0
                         (b - a)) l1 , l2)
else if b < a
     then (l1 , List.append (clone 0
                                   (a - b)) l2)
     else (l1 , l2)
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,10)-(9,24)
(List.length l1 , List.length l2)
TupleG (fromList [AppG (fromList [EmptyG])])

(9,28)-(9,77)
EMPTY
EmptyG

(9,54)-(9,77)
b - a
BopG VarG VarG

(9,57)-(9,58)
EMPTY
EmptyG

(9,61)-(9,62)
a
VarG

(9,68)-(9,73)
clone 0 (b - a)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,68)-(9,77)
(List.append (clone 0 (b - a))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,76)-(9,77)
EMPTY
EmptyG

*)
