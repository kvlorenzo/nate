
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if List.length = 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,47)
a ^ (x ^ sep)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,21)-(6,32)
List.length t
AppG (fromList [VarG])

(6,21)-(6,36)
List.length t < 2
BopG (AppG (fromList [EmptyG])) LitG

(6,35)-(6,36)
t
VarG

(7,6)-(7,60)
x ^ sep
AppG (fromList [VarG])

*)
