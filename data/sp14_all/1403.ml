
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat "" l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
sepConcat "" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,23)-(9,46)
EMPTY
EmptyG

(9,45)-(9,46)
List.map f l
AppG (fromList [VarG])

*)
