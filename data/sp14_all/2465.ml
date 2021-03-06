
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (List.map (f l)) l;;


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
(9,23)-(9,32)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,33)-(9,49)
";"
LitG

(9,34)-(9,42)
List.map f l
AppG (fromList [VarG])

(9,43)-(9,48)
EMPTY
EmptyG

(9,50)-(9,51)
"]"
LitG

*)
