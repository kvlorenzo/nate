
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " List.map (f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " l;;

*)

(* changed spans
(9,23)-(9,51)
sepConcat " " l
AppG (fromList [VarG,LitG])

(9,37)-(9,45)
EMPTY
EmptyG

(9,46)-(9,51)
EMPTY
EmptyG

(9,47)-(9,48)
EMPTY
EmptyG

*)
