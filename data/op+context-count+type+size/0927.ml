
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " [["["]; List.map f l; ["]"]];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) ["]"]);;

*)

(* changed spans
(9,39)-(9,67)
(9,40)-(9,45)
(9,41)-(9,44)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(4,11)-(4,13)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
(9,24)-(9,33)
(9,24)-(9,67)
(9,34)-(9,38)
(9,39)-(9,67)
(9,40)-(9,45)
(9,41)-(9,44)
*)