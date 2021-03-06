
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (0, (sum / 10)) :: (0, (sum mod 10)) :: a
      | (h1,h)::t -> (0, (sum / 10)) :: (0, (h + (sum mod 10))) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | (0,[]) -> ((b / 10), [b mod 10])
      | (y,h::t) -> ((b / 10), ((b mod 10) :: (h + y) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(23,68)
let b = fst x + snd x in
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(21,6)-(23,68)
match a with
| (0 , []) -> (b / 10 , [b mod 10])
| (y , h :: t) -> (b / 10 , (b mod 10) :: ((h + y) :: t))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(22,14)-(22,55)
EMPTY
EmptyG

(22,15)-(22,16)
EMPTY
EmptyG

(22,19)-(22,22)
b
VarG

(22,33)-(22,50)
EMPTY
EmptyG

(22,33)-(22,55)
EMPTY
EmptyG

(22,34)-(22,35)
[b mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(22,38)-(22,41)
b
VarG

(22,54)-(22,55)
EMPTY
EmptyG

(23,21)-(23,68)
EMPTY
EmptyG

(23,22)-(23,23)
EMPTY
EmptyG

(23,26)-(23,29)
b
VarG

(23,40)-(23,63)
EMPTY
EmptyG

(23,41)-(23,42)
EMPTY
EmptyG

(23,44)-(23,62)
EMPTY
EmptyG

(23,45)-(23,46)
EMPTY
EmptyG

(23,49)-(23,61)
h + y
BopG VarG VarG

(23,50)-(23,53)
b
VarG

(23,58)-(23,60)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
