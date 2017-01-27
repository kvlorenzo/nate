
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (a ^ sep) x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,30)
(6,29)-(6,30)
*)

(* type error slice
(6,20)-(6,21)
(6,20)-(6,27)
(6,20)-(6,30)
(6,22)-(6,23)
(6,24)-(6,27)
(6,29)-(6,30)
*)