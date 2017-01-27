
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" [List.map (f l)]) ^ "]");;


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
(7,31)-(7,33)
(9,46)-(9,62)
(9,47)-(9,60)
(9,57)-(9,60)
*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(2,23)-(7,60)
(3,3)-(7,60)
(4,11)-(4,13)
(6,7)-(7,60)
(6,13)-(6,31)
(6,15)-(6,31)
(6,19)-(6,20)
(6,19)-(6,31)
(6,21)-(6,22)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
(7,7)-(7,60)
(7,18)-(7,19)
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
(9,32)-(9,41)
(9,32)-(9,62)
(9,42)-(9,45)
(9,46)-(9,62)
(9,47)-(9,55)
(9,47)-(9,60)
*)
