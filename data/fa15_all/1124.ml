
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (a,h::t) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (a :: ((((fst x) + (snd x)) + a) mod 10)))
          else (0, (a :: ((((fst x) + (snd x)) + a) mod 10)))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (a,h::t) ->
          if (((fst x) + (snd x)) + a) > 9
          then (1, (a :: ((((fst x) + (snd x)) + a) mod 10) :: t))
          else (0, (a :: ((((fst x) + (snd x)) + a) mod 10) :: t))
      | _ ->
          if ((fst x) + (snd x)) > 9
          then (1, [((fst x) + (snd x)) mod 10])
          else (0, [((fst x) + (snd x)) mod 10]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,25)-(21,59)
(((fst x + snd x) + a) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG]))) Nothing

(22,15)-(22,61)
t
VarG

(22,25)-(22,59)
(((fst x + snd x) + a) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG (BopG (AppG (fromList [VarG])) (AppG (fromList [VarG]))) VarG) LitG]))) Nothing

(24,10)-(26,48)
t
VarG

*)
