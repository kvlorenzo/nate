
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = failwith List.map sepConcat l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "," (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
EMPTY
EmptyG

(9,23)-(9,52)
EMPTY
EmptyG

(9,32)-(9,40)
sepConcat "," (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,51)-(9,52)
List.map f l
AppG (fromList [VarG])

*)
