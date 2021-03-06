
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: ((h + c) mod 10) :: t
      | _ -> [c / 10; c mod 10] in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(21,31)
EMPTY
EmptyG

(18,14)-(18,21)
EMPTY
EmptyG

(18,14)-(18,31)
EMPTY
EmptyG

(18,15)-(18,18)
EMPTY
EmptyG

(18,19)-(18,20)
EMPTY
EmptyG

(18,24)-(18,31)
EMPTY
EmptyG

(18,25)-(18,28)
let (x1 , x2) = x in
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,6)-(21,31)
let (a1 , a2) = a in
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(19,12)-(19,13)
x2
VarG

(20,16)-(20,55)
((x1 + x2) / 10 , (((a1 + x1) + x2) mod 10) :: a2)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(20,18)-(20,19)
EMPTY
EmptyG

(20,22)-(20,23)
x1
VarG

(20,36)-(20,37)
EMPTY
EmptyG

(20,40)-(20,41)
EMPTY
EmptyG

(20,47)-(20,49)
EMPTY
EmptyG

(20,54)-(20,55)
EMPTY
EmptyG

(21,13)-(21,31)
x2
VarG

(21,14)-(21,15)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(21,14)-(21,20)
a2
VarG

(21,18)-(21,20)
EMPTY
EmptyG

(21,22)-(21,23)
a1 + x1
BopG VarG VarG

(21,22)-(21,30)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)
