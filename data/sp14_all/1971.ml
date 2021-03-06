
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev t) ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,30)
EMPTY
EmptyG

(6,19)-(6,27)
EMPTY
EmptyG

(6,28)-(6,29)
x
VarG

*)
