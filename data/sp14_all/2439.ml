
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone (l1, (0 :: l2))
  else
    if (List.length l1) < (List.length l2)
    then clone ((0 :: l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,12)
List.length
VarG

(6,7)-(6,28)
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(6,13)-(6,28)
List.length l2
AppG (fromList [VarG])

(6,18)-(6,27)
List.append (clone 0 l1G) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,19)-(6,20)
clone 0 l1G
AppG (fromList [VarG,LitG])

(6,24)-(6,26)
l1G
VarG

(9,9)-(9,14)
List.length
VarG

(9,9)-(9,30)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(9,15)-(9,30)
List.length l1
AppG (fromList [VarG])

(9,16)-(9,25)
List.append (clone 0 l2G) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(9,17)-(9,18)
clone 0 l2G
AppG (fromList [VarG,LitG])

(9,22)-(9,24)
l2G
VarG

*)
