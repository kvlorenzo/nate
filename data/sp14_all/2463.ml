
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (sepConcat "" l) List.map (f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,23)-(9,39)
"["
LitG

(9,24)-(9,33)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,34)-(9,36)
EMPTY
EmptyG

(9,37)-(9,38)
";"
LitG

(9,40)-(9,48)
List.map f l
AppG (fromList [VarG])

(9,49)-(9,54)
EMPTY
EmptyG

*)
