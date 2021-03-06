
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [(0, (x + y))] in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          (match a with
           | (m,n) ->
               if ((i + j) + m) >= 10
               then (1, ((((i + j) + m) - 10) :: n))
               else (0, (((i + j) + m) :: n))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,54)
match x with
| (i , j) -> match a with
             | (m , n) -> if ((i + j) + m) >= 10
                          then (1 , (((i + j) + m) - 10) :: n)
                          else (0 , ((i + j) + m) :: n)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(14,40)-(14,54)
match a with
| (m , n) -> if ((i + j) + m) >= 10
             then (1 , (((i + j) + m) - 10) :: n)
             else (0 , ((i + j) + m) :: n)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(14,41)-(14,53)
if ((i + j) + m) >= 10
then (1 , (((i + j) + m) - 10) :: n)
else (0 , ((i + j) + m) :: n)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(14,42)-(14,43)
((i + j) + m) - 10
BopG (BopG EmptyG EmptyG) LitG

(14,45)-(14,52)
((i + j) + m) :: n
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) VarG]))) Nothing

(14,46)-(14,47)
EMPTY
EmptyG

(14,50)-(14,51)
i + j
BopG VarG VarG

(15,4)-(17,51)
n
VarG

(15,15)-(15,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
