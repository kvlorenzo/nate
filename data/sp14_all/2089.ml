
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = [List.combine (List.rev l1) (List.rev l2); (0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = (List.combine (List.rev l1) (List.rev l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,15)-(30,65)
EMPTY
EmptyG

(30,16)-(30,28)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(30,58)-(30,64)
[(0 , 0)]
ListG (TupleG (fromList [EmptyG])) Nothing

*)
