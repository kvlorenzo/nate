
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat (";", l));;


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
(7,17)-(7,54)
EMPTY
EmptyG

(7,20)-(7,36)
EMPTY
EmptyG

(7,20)-(7,40)
EMPTY
EmptyG

(7,21)-(7,32)
EMPTY
EmptyG

(7,33)-(7,35)
EMPTY
EmptyG

(7,39)-(7,40)
EMPTY
EmptyG

(7,53)-(7,54)
EMPTY
EmptyG

(10,23)-(10,31)
EMPTY
EmptyG

(10,23)-(10,52)
EMPTY
EmptyG

(10,32)-(10,52)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(10,43)-(10,51)
EMPTY
EmptyG

(10,49)-(10,50)
List.map f l
AppG (fromList [VarG])

*)
