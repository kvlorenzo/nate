
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat f) (f l);;


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
(9,23)-(9,31)
EMPTY
EmptyG

(9,32)-(9,45)
(^)
VarG

(9,33)-(9,42)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,43)-(9,44)
EMPTY
EmptyG

(9,46)-(9,51)
";"
LitG

(9,47)-(9,48)
List.map f l
AppG (fromList [VarG])

*)
