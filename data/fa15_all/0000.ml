
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | h::t -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,currentSum) = a in
      let (toSum1,toSum2) = x in
      let intermediateValue = (toSum1 + toSum2) + carry in
      let valueToAddToArray = intermediateValue mod 10 in
      let carry = intermediateValue / 10 in
      (carry, (valueToAddToArray :: currentSum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,16)-(18,24)
EMPTY
EmptyG

(18,16)-(18,44)
EMPTY
EmptyG

(18,25)-(18,44)
let (carry , currentSum) =
  a in
let (toSum1 , toSum2) = x in
let intermediateValue =
  (toSum1 + toSum2) + carry in
let valueToAddToArray =
  intermediateValue mod 10 in
let carry =
  intermediateValue / 10 in
(carry , valueToAddToArray :: currentSum)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
let (toSum1 , toSum2) = x in
let intermediateValue =
  (toSum1 + toSum2) + carry in
let valueToAddToArray =
  intermediateValue mod 10 in
let carry =
  intermediateValue / 10 in
(carry , valueToAddToArray :: currentSum)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,15)-(19,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(20,4)-(21,51)
[]
ListG EmptyG Nothing

(20,15)-(20,23)
EMPTY
EmptyG

(20,24)-(20,43)
List.rev
VarG

(21,4)-(21,51)
List.combine l1 l2
AppG (fromList [VarG])

*)
