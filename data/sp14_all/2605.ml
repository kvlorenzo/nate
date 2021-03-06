
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if (fir + sec) < 10
          then ([], ((fir + sec) :: b2))
          else (((fir + sec) / 10), (((fir + sec) mod 10) :: b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(25,65)
let getTail =
  fun l ->
    match l with
    | [] -> []
    | h :: t -> t in
let getCarry =
  fun (c , l) -> c in
let carry = getCarry a in
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(20,20)-(20,21)
let getCarry =
  fun (c , l) -> c in
let carry = getCarry a in
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(21,6)-(25,65)
EMPTY
EmptyG

(21,12)-(21,13)
let getSum =
  fun (c , l) -> l in
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,10)-(25,65)
let sum =
  if carry = 1
  then getTail (getSum a)
  else getSum a in
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [IteG EmptyG EmptyG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,13)-(23,24)
let add =
  fun (m , n) -> m + n in
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,13)-(23,29)
carry = 1
BopG VarG LitG

(23,14)-(23,17)
EMPTY
EmptyG

(23,20)-(23,23)
EMPTY
EmptyG

(23,27)-(23,29)
EMPTY
EmptyG

(24,15)-(24,40)
EMPTY
EmptyG

(24,16)-(24,18)
EMPTY
EmptyG

(24,20)-(24,39)
m
VarG

(24,21)-(24,32)
let digit = add x + carry in
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(24,22)-(24,25)
EMPTY
EmptyG

(24,28)-(24,31)
EMPTY
EmptyG

(24,36)-(24,38)
add x
AppG (fromList [VarG])

(25,15)-(25,65)
if digit > 9
then (1 , 1 :: ((digit - 10) :: sum))
else (0 , digit :: sum)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(25,16)-(25,34)
EMPTY
EmptyG

(25,17)-(25,28)
EMPTY
EmptyG

(25,18)-(25,21)
EMPTY
EmptyG

(25,24)-(25,27)
EMPTY
EmptyG

(25,31)-(25,33)
1
LitG

(25,37)-(25,57)
EMPTY
EmptyG

(25,38)-(25,49)
EMPTY
EmptyG

(25,39)-(25,42)
EMPTY
EmptyG

(25,45)-(25,48)
1
LitG

(25,54)-(25,56)
digit - 10
BopG VarG LitG

(25,61)-(25,63)
sum
VarG

(26,4)-(28,53)
(0 , digit :: sum)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(28,4)-(28,53)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
