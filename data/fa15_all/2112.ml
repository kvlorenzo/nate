
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (";", (List.map (f l)))) ^ "]");;


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
(9,30)-(9,65)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,41)-(9,64)
EMPTY
EmptyG

(9,47)-(9,63)
List.map f l
AppG (fromList [VarG])

(9,57)-(9,62)
EMPTY
EmptyG

*)
