
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,31)-(6,34)
(6,33)-(6,34)
*)

(* type error slice
(3,3)-(7,59)
(6,7)-(7,59)
(6,13)-(6,34)
(6,15)-(6,34)
(6,19)-(6,20)
(6,19)-(6,34)
(6,21)-(6,22)
(6,24)-(6,27)
(6,24)-(6,34)
(6,28)-(6,29)
(6,31)-(6,32)
(6,31)-(6,34)
(6,33)-(6,34)
(7,7)-(7,59)
(7,18)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
*)