
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat (" ", (List.map (f, l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat "" (List.map f l);;

*)

(* changed spans
(13,9)-(13,43)
sepConcat "" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(13,19)-(13,43)
EMPTY
EmptyG

(13,20)-(13,23)
EMPTY
EmptyG

(13,25)-(13,42)
""
LitG

(13,26)-(13,34)
List.map f l
AppG (fromList [VarG])

(13,35)-(13,41)
EMPTY
EmptyG

*)
