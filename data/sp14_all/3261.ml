
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if x = "a" then a ^ x in
      let base = sep in let l = t in List.fold_left f base l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(8,18)-(8,39)
a
VarG

(8,21)-(8,22)
EMPTY
EmptyG

(8,21)-(8,28)
EMPTY
EmptyG

(8,25)-(8,28)
EMPTY
EmptyG

(8,34)-(8,35)
EMPTY
EmptyG

*)
