
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,33)
*)

(* type error slice
(6,7)-(7,60)
(6,13)-(6,32)
(6,15)-(6,32)
(6,20)-(6,21)
(6,20)-(6,27)
(6,20)-(6,32)
(6,22)-(6,23)
(6,24)-(6,27)
(6,29)-(6,30)
(6,31)-(6,32)
(7,7)-(7,60)
(7,18)-(7,20)
(7,24)-(7,60)
(7,32)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
*)
