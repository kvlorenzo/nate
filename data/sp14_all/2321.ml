
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in (asd3, ((padZero asd3 asd2) :: b))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x / h) > 0
      then
        let asd = x / h in
        let asd2 = (x + h) - (asd * 10) in
        let asd3 = asd :: t in
        let (_,asd4) = padZero asd3 (asd2 :: b) in (asd3, asd4)
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,31)-(25,65)
EMPTY
EmptyG

(25,32)-(25,36)
EMPTY
EmptyG

(25,38)-(25,64)
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (TupleG (fromList [EmptyG]))

(25,53)-(25,57)
asd2 :: b
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(26,12)-(26,13)
(t , (x + h) :: b)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG VarG]))) Nothing])

*)
