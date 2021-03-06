
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
      let base = t in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(^)
VarG

(7,17)-(7,18)
EMPTY
EmptyG

(7,22)-(7,58)
EMPTY
EmptyG

(7,35)-(7,58)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
