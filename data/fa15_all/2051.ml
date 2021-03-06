
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (sepConcat sep a) @ x in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,35)
EMPTY
EmptyG

(6,19)-(6,28)
EMPTY
EmptyG

(6,29)-(6,32)
(^)
VarG

(6,36)-(6,37)
EMPTY
EmptyG

(6,38)-(6,39)
sep
VarG

(7,17)-(7,19)
h
VarG

*)
