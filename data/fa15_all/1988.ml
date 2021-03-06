
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat sep t)) in
      let base = t in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
a
VarG

(6,29)-(6,46)
EMPTY
EmptyG

(6,30)-(6,39)
EMPTY
EmptyG

(6,40)-(6,43)
EMPTY
EmptyG

(6,44)-(6,45)
x
VarG

(7,17)-(7,18)
sep
VarG

(8,14)-(8,22)
EMPTY
EmptyG

(8,14)-(8,42)
EMPTY
EmptyG

(8,23)-(8,42)
t
VarG

*)
