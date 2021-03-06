
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" List.map (fun f  -> f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,23)-(9,61)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,37)-(9,45)
List.map f l
AppG (fromList [VarG])

(9,46)-(9,61)
EMPTY
EmptyG

(9,57)-(9,60)
EMPTY
EmptyG

*)
