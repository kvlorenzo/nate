
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2)::t' = a in
      match x with
      | [] -> if a1 = 0 then [] else [(0, a1)]
      | (x1,x2)::t ->
          let value = (a1 + x1) + x2 in
          if value > 9 then [(1, (value - 10))] @ a else (0, value) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      let (x1,x2) = x in
      let val1 = (a1 + x1) + x2 in
      let val2 = (x1 + x2) / 10 in (val2, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(21,72)
let (a1 , a2) = a in
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,6)-(21,72)
let (x1 , x2) = x in
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(18,14)-(18,46)
EMPTY
EmptyG

(18,17)-(18,19)
EMPTY
EmptyG

(18,17)-(18,23)
EMPTY
EmptyG

(18,22)-(18,23)
EMPTY
EmptyG

(18,29)-(18,31)
EMPTY
EmptyG

(18,37)-(18,46)
EMPTY
EmptyG

(18,38)-(18,45)
EMPTY
EmptyG

(18,39)-(18,40)
EMPTY
EmptyG

(18,42)-(18,44)
EMPTY
EmptyG

(20,10)-(21,72)
let val1 = (a1 + x1) + x2 in
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,10)-(21,72)
EMPTY
EmptyG

(21,13)-(21,18)
EMPTY
EmptyG

(21,13)-(21,22)
EMPTY
EmptyG

(21,21)-(21,22)
EMPTY
EmptyG

(21,28)-(21,47)
EMPTY
EmptyG

(21,28)-(21,51)
EMPTY
EmptyG

(21,29)-(21,46)
EMPTY
EmptyG

(21,30)-(21,31)
EMPTY
EmptyG

(21,33)-(21,45)
EMPTY
EmptyG

(21,34)-(21,39)
let val2 = (x1 + x2) / 10 in
(val2 , val1 :: a2)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (TupleG (fromList [EmptyG]))

(21,42)-(21,44)
(x1 + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(21,48)-(21,49)
EMPTY
EmptyG

(21,50)-(21,51)
(val2 , val1 :: a2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(21,57)-(21,67)
let base = (0 , []) in
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,57)-(21,72)
val2
VarG

(21,61)-(21,66)
EMPTY
EmptyG

(21,71)-(21,72)
EMPTY
EmptyG

(22,4)-(24,51)
EMPTY
EmptyG

*)
