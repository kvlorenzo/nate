
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (c,d::t) -> (c, (t :: a)) in
    let base = (0, []) in
    let args = match l1 with | h::t -> [(h, (List.rev l2))] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          ((d1 + d2), ((d1 + d2) :: ((match a with | (a1,a2) -> a2)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,56)
match x with
| (d1 , d2) -> (d1 + d2 , (d1 + d2) :: (match a with
                                        | (a1 , a2) -> a2))
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(23,44)-(23,45)
d1 + d2
BopG VarG VarG

(23,47)-(23,55)
d2
VarG

(23,48)-(23,49)
d1 + d2
BopG VarG VarG

(23,53)-(23,54)
match a with
| (a1 , a2) -> a2
CaseG VarG (fromList [(Nothing,VarG)])

(24,4)-(26,51)
a2
VarG

(25,15)-(25,59)
EMPTY
EmptyG

(25,21)-(25,23)
EMPTY
EmptyG

(25,39)-(25,59)
EMPTY
EmptyG

(25,40)-(25,58)
EMPTY
EmptyG

(25,41)-(25,42)
EMPTY
EmptyG

(25,54)-(25,56)
List.combine l1 l2
AppG (fromList [VarG])

*)
