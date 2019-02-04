
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a (f b) in
  let base = [""] in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,68)
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

(3,63)-(3,68)
EMPTY
EmptyG

(3,64)-(3,65)
EMPTY
EmptyG

(4,13)-(4,17)
EMPTY
EmptyG

*)
