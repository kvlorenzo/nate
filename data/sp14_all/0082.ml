
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x mod 10) :: a in
    let base = [] in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,26)
(fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
TupleG (fromList [BopG EmptyG EmptyG,ListG EmptyG Nothing])

(16,16)-(16,31)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(16,17)-(16,18)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(16,23)-(16,25)
snd x
AppG (fromList [VarG])

(16,30)-(16,31)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,4)-(18,68)
[]
ListG EmptyG Nothing

(17,15)-(17,17)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,15)-(18,17)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(18,21)-(18,68)
List.rev l2
AppG (fromList [VarG])

*)
