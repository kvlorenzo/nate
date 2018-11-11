
let bigMul l1 l2 =
  let f a x = x in
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
(3,14)-(3,15)
match x with
| (k , v) -> ([k] , v)
CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG])]

(4,2)-(11,49)
k
VarG

(4,2)-(11,49)
v
VarG

(4,2)-(11,49)
([k] , v)
TupleG [ListG EmptyG Nothing,VarG]

(4,2)-(11,49)
[k]
ListG VarG Nothing

*)