
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a + x) mod 10 in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,23)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
LetG NonRec [CaseG EmptyG [(Nothing,EmptyG)]] (CaseG EmptyG [(Nothing,EmptyG)])

(15,17)-(15,18)
match a with
| (x , y) -> x
CaseG VarG [(Nothing,VarG)]

(15,28)-(15,30)
x
VarG

(15,28)-(15,30)
carry
VarG

(15,28)-(15,30)
add1
VarG

(15,28)-(15,30)
add2
VarG

(15,28)-(15,30)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(15,28)-(15,30)
((carry + add1) + add2) / 10
BopG (BopG EmptyG EmptyG) LitG

(15,28)-(15,30)
carry + add1
BopG VarG VarG

(15,28)-(15,30)
let new_carry =
  ((carry + add1) + add2) / 10 in
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(15,28)-(15,30)
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
CaseG VarG [(Nothing,LetG NonRec [EmptyG] EmptyG)]

(16,4)-(17,68)
carry
VarG

(16,4)-(17,68)
add1
VarG

(16,4)-(17,68)
add2
VarG

(16,4)-(17,68)
a
VarG

(16,4)-(17,68)
new_carry
VarG

(16,4)-(17,68)
digit
VarG

(16,4)-(17,68)
y
VarG

(16,4)-(17,68)
(carry + add1) + add2
BopG (BopG EmptyG EmptyG) VarG

(16,4)-(17,68)
((carry + add1) + add2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(16,4)-(17,68)
carry + add1
BopG VarG VarG

(16,4)-(17,68)
10
LitG

(16,4)-(17,68)
let digit =
  ((carry + add1) + add2) mod 10 in
match a with
| (x , y) -> (new_carry , digit :: y)
LetG NonRec [BopG EmptyG EmptyG] (CaseG EmptyG [(Nothing,EmptyG)])

(16,4)-(17,68)
match a with
| (x , y) -> (new_carry , digit :: y)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(16,4)-(17,68)
(new_carry , digit :: y)
TupleG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(16,4)-(17,68)
digit :: y
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(16,15)-(16,16)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(17,4)-(17,68)
[]
ListG EmptyG Nothing

(17,15)-(17,17)
List.rev
VarG

(17,15)-(17,17)
List.combine
VarG

(17,15)-(17,17)
List.rev (List.combine l1 l2)
AppG [AppG [EmptyG,EmptyG]]

(17,15)-(17,17)
List.combine l1 l2
AppG [VarG,VarG]

(17,21)-(17,68)
l2
VarG

*)