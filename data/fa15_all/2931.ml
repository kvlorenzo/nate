
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((List.hd l1) + (List.hd l2)) mod 10 in
    let base = 0 in
    let args = ((List.hd l1) + (List.hd l2)) / 10 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,45)
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,16)-(16,52)
let (lh1 , lh2) = x in
let (carry , res) = a in
let num =
  (lh1 + lh2) + carry in
(num / 10 , (num mod 10) :: res)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(16,17)-(16,29)
EMPTY
EmptyG

(16,18)-(16,25)
EMPTY
EmptyG

(16,26)-(16,28)
EMPTY
EmptyG

(16,32)-(16,44)
EMPTY
EmptyG

(16,33)-(16,40)
EMPTY
EmptyG

(16,41)-(16,43)
lh1 + lh2
BopG VarG VarG

(16,50)-(16,52)
(num / 10 , (num mod 10) :: res)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(17,4)-(19,51)
num mod 10
BopG VarG LitG

(17,15)-(17,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,4)-(19,51)
[]
ListG EmptyG Nothing

(18,15)-(18,44)
EMPTY
EmptyG

(18,15)-(18,49)
EMPTY
EmptyG

(18,17)-(18,24)
List.rev
VarG

(18,25)-(18,27)
List.combine l1 l2
AppG (fromList [VarG])

(18,31)-(18,43)
EMPTY
EmptyG

(18,32)-(18,39)
EMPTY
EmptyG

(18,47)-(18,49)
EMPTY
EmptyG

*)
