
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,32)
t
VarG

*)
