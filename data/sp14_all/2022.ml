
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [bigAdd (mulByDigit x l2) [h / 10]; h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(38,4)-(40,63)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(39,12)-(39,34)
EMPTY
EmptyG

(39,33)-(39,34)
EMPTY
EmptyG

(40,14)-(40,59)
EMPTY
EmptyG

(40,15)-(40,48)
EMPTY
EmptyG

(40,22)-(40,39)
a
VarG

(40,40)-(40,48)
EMPTY
EmptyG

(40,41)-(40,42)
EMPTY
EmptyG

(40,41)-(40,47)
EMPTY
EmptyG

(40,45)-(40,47)
EMPTY
EmptyG

(40,50)-(40,51)
EMPTY
EmptyG

(40,50)-(40,58)
EMPTY
EmptyG

(40,56)-(40,58)
EMPTY
EmptyG

(40,60)-(40,61)
EMPTY
EmptyG

(40,62)-(40,63)
EMPTY
EmptyG

(42,28)-(42,75)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
