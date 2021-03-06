
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (x,y)::t -> ((x + y) / 10) :: ((x + y) mod 10) :: t
      | _ -> a in
    let base = [] in
    let args = List.rev ((List.combine l1 l2) @ (0, 0)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,14)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,12)-(19,13)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(20,20)-(20,59)
((w + z) / 10 , ((w + z) mod 10) :: y)
TupleG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(20,22)-(20,23)
EMPTY
EmptyG

(20,26)-(20,27)
w
VarG

(20,31)-(20,33)
z
VarG

(20,40)-(20,41)
EMPTY
EmptyG

(20,44)-(20,45)
w
VarG

(20,51)-(20,53)
z
VarG

(20,58)-(20,59)
EMPTY
EmptyG

(21,13)-(21,14)
y
VarG

(22,15)-(22,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(23,25)-(23,45)
EMPTY
EmptyG

(23,46)-(23,47)
EMPTY
EmptyG

(23,48)-(23,54)
EMPTY
EmptyG

(23,49)-(23,50)
EMPTY
EmptyG

(23,52)-(23,53)
EMPTY
EmptyG

*)
