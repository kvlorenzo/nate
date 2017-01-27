
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev t) ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,28)
(6,20)-(6,30)
(6,29)-(6,30)
*)

(* type error slice
(3,3)-(7,66)
(6,20)-(6,28)
(6,20)-(6,30)
(6,20)-(6,35)
(6,29)-(6,30)
(6,32)-(6,33)
(6,34)-(6,35)
*)
