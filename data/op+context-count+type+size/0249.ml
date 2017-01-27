
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l = (^) sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,35)
(7,32)-(7,39)
(7,36)-(7,39)
*)

(* type error slice
(6,7)-(7,66)
(6,13)-(6,22)
(6,15)-(6,22)
(6,19)-(6,20)
(6,19)-(6,22)
(6,21)-(6,22)
(7,7)-(7,66)
(7,18)-(7,20)
(7,24)-(7,66)
(7,32)-(7,35)
(7,32)-(7,39)
(7,36)-(7,39)
(7,43)-(7,57)
(7,43)-(7,66)
(7,58)-(7,59)
(7,60)-(7,64)
(7,65)-(7,66)
*)
