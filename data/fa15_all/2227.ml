
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args =
      let combine (a,b) = a + b in
      List.map f (List.rev (List.combine (l1 l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,24)
EMPTY
EmptyG

(18,16)-(18,44)
EMPTY
EmptyG

(18,25)-(18,44)
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(19,4)-(23,51)
(o , [x])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(19,15)-(19,23)
EMPTY
EmptyG

(19,15)-(19,43)
EMPTY
EmptyG

(19,24)-(19,43)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(20,4)-(23,51)
[]
ListG EmptyG Nothing

(22,15)-(22,16)
combine
VarG

(22,27)-(22,49)
List.combine l1 l2
AppG (fromList [VarG])

(22,41)-(22,48)
EMPTY
EmptyG

*)
