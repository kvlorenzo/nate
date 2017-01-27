
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ("" List.map (f l));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let x = List.map f l in sepConcat ";" x;;

*)

(* changed spans
(9,24)-(9,33)
(9,24)-(9,51)
(9,35)-(9,37)
(9,48)-(9,51)
*)

(* type error slice
(9,35)-(9,37)
(9,35)-(9,51)
(9,38)-(9,46)
*)
