
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],_),y) -> (([], 0), y)
      | ((h::t,carry),y) ->
          let sum = (h + x) + carry in ((t, (sum / 10)), ((sum mod 10) :: y)) in
    let base = ((((List.rev 0) :: l1), 0), []) in
    let args = (List.rev 0) :: l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],_),y) -> (([], 0), y)
      | ((h::t,carry),y) ->
          let sum = (h + x) + carry in ((t, (sum / 10)), ((sum mod 10) :: y)) in
    let base = (((List.rev (0 :: l1)), 0), []) in
    let args = List.rev (0 :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,17)-(25,37)
EMPTY
EmptyG

(25,28)-(25,29)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

(26,15)-(26,33)
EMPTY
EmptyG

(26,25)-(26,26)
0 :: l2
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

*)
