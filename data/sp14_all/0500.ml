
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in (tens, (tens :: ones :: res)) in
    let base = ([0], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(23,76)
if carry <> []
then (let ch :: _ = carry in
      let tens =
        ((x1 + x2) + ch) / 10 in
      let ones =
        ((x1 + x2) + ch) mod 10 in
      ([tens] , tens :: (ones :: res)))
else (let tens =
        (x1 + x2) / 10 in
      let ones = (x1 + x2) mod 10 in
      ([tens] , tens :: (ones :: res)))
IteG (BopG EmptyG EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)

(22,17)-(22,41)
((x1 + x2) + ch) / 10
BopG (BopG EmptyG EmptyG) LitG

(22,29)-(22,41)
EMPTY
EmptyG

(22,30)-(22,35)
ch
VarG

(23,17)-(23,43)
((x1 + x2) + ch) mod 10
BopG (BopG EmptyG EmptyG) LitG

(23,29)-(23,43)
let tens = (x1 + x2) / 10 in
let ones = (x1 + x2) mod 10 in
([tens] , tens :: (ones :: res))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,30)-(23,35)
x1 + x2
BopG VarG VarG

(23,40)-(23,42)
x2
VarG

(23,48)-(23,52)
[tens]
ListG VarG Nothing

(24,16)-(24,19)
EMPTY
EmptyG

(24,17)-(24,18)
EMPTY
EmptyG

(25,4)-(26,51)
[]
ListG EmptyG Nothing

*)
