
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a b in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,64)
EMPTY
EmptyG

(3,21)-(3,22)
EMPTY
EmptyG

(3,36)-(3,38)
EMPTY
EmptyG

(3,49)-(3,60)
(^)
VarG

*)