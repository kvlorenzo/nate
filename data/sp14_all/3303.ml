
let bigMul l1 l2 =
  let f a x = ([0], [x]) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = match x with | (k,v) -> ([k], v) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,14)-(3,24)
match x with
| (k , v) -> ([k] , v)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(3,16)-(3,17)
EMPTY
EmptyG

(3,20)-(3,23)
EMPTY
EmptyG

(3,21)-(3,22)
k
VarG

(4,2)-(11,49)
v
VarG

*)
