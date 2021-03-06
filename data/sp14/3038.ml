
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(8,14)-(8,35)
(8,15)-(8,34)
(8,26)-(8,27)
(8,26)-(8,33)
(8,28)-(8,29)
(8,30)-(8,33)
*)

(* type error slice
(6,6)-(8,62)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,19)
(6,18)-(6,23)
(6,20)-(6,21)
(8,6)-(8,62)
(8,14)-(8,35)
(8,15)-(8,34)
(8,39)-(8,53)
(8,39)-(8,62)
(8,54)-(8,55)
(8,61)-(8,62)
*)

(* all spans
(2,18)-(8,62)
(2,22)-(8,62)
(3,2)-(8,62)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(8,62)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(8,62)
(7,17)-(7,19)
(8,6)-(8,62)
(8,14)-(8,35)
(8,15)-(8,34)
(8,26)-(8,33)
(8,28)-(8,29)
(8,26)-(8,27)
(8,30)-(8,33)
(8,39)-(8,62)
(8,39)-(8,53)
(8,54)-(8,55)
(8,56)-(8,60)
(8,61)-(8,62)
*)
