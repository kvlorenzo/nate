
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
EMPTY
EmptyG

(6,18)-(6,21)
EMPTY
EmptyG

(7,17)-(7,19)
EMPTY
EmptyG

(7,23)-(7,59)
EMPTY
EmptyG

(7,36)-(7,59)
let l = t in
List.fold_left f base l
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
