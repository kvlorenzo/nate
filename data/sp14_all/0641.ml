
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    let (i,l) = x in
    let (i',l') = a in
    match i with | [] -> l' | h::t -> bigAdd ((mulByDigit h l'), l') in
  let base = (1, l1) in
  let args = ((List.rev l2), l1) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x',x'') = x in
      let (c,s) = a in
      if (List.length s) = ((List.length l1) - 1)
      then (c, ((((c + x') + x'') / 10) :: (((c + x') + x'') mod 10) :: s))
      else ((((c + x') + x'') / 10), ((((c + x') + x'') mod 10) :: s)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [0];;

let bigMul l1 l2 =
  let f a x =
    match a with | (l1',a') -> (l1', (bigAdd (mulByDigit x l1') a')) in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,4)-(33,68)
EMPTY
EmptyG

(31,16)-(31,17)
EMPTY
EmptyG

(32,4)-(33,68)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(33,4)-(33,68)
EMPTY
EmptyG

(33,10)-(33,11)
EMPTY
EmptyG

(33,25)-(33,27)
EMPTY
EmptyG

(33,38)-(33,44)
mulByDigit x l1'
AppG (fromList [VarG])

(33,38)-(33,68)
l1'
VarG

(33,58)-(33,59)
a'
VarG

(33,60)-(33,62)
EMPTY
EmptyG

(33,65)-(33,67)
x
VarG

(34,13)-(34,20)
[]
ListG EmptyG Nothing

(34,14)-(34,15)
EMPTY
EmptyG

(35,13)-(35,32)
EMPTY
EmptyG

(35,29)-(35,31)
EMPTY
EmptyG

*)
