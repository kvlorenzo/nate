
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = x in let b::b' = y in let c::c' = z in [b + c] @ a in
    let base = [] in
    let args = ([l1], [l2]) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,45)-(3,48)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(3,45)-(3,68)
EMPTY
EmptyG

(3,49)-(3,50)
EMPTY
EmptyG

(5,6)-(5,11)
EMPTY
EmptyG

(5,10)-(5,11)
EMPTY
EmptyG

(25,6)-(25,68)
let (x1 , x2) = x in
([x1 + x2] , [x2])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(25,23)-(25,68)
EMPTY
EmptyG

(25,35)-(25,36)
EMPTY
EmptyG

(25,40)-(25,68)
EMPTY
EmptyG

(25,52)-(25,53)
EMPTY
EmptyG

(25,57)-(25,68)
EMPTY
EmptyG

(25,58)-(25,59)
EMPTY
EmptyG

(25,62)-(25,63)
EMPTY
EmptyG

(25,65)-(25,66)
([x1 + x2] , [x2])
TupleG (fromList [ListG EmptyG Nothing])

(25,67)-(25,68)
x1
VarG

(26,4)-(28,51)
[x2]
ListG VarG Nothing

(26,15)-(26,17)
([] , [])
TupleG (fromList [ListG EmptyG Nothing])

(27,4)-(28,51)
[]
ListG EmptyG Nothing

(27,15)-(27,27)
EMPTY
EmptyG

(27,16)-(27,20)
List.combine l1 l2
AppG (fromList [VarG])

(27,17)-(27,19)
List.combine
VarG

(27,22)-(27,26)
EMPTY
EmptyG

*)
