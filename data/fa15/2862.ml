
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,39)
(3,20)-(3,22)
(4,13)-(4,14)
(4,18)-(4,42)
*)

(* type error slice
(4,2)-(4,42)
(4,13)-(4,14)
(4,18)-(4,32)
(4,18)-(4,42)
(4,33)-(4,34)
(4,35)-(4,39)
*)

(* all spans
(2,9)-(4,42)
(3,2)-(4,42)
(3,8)-(3,39)
(3,10)-(3,39)
(3,14)-(3,39)
(3,20)-(3,22)
(3,38)-(3,39)
(4,2)-(4,42)
(4,13)-(4,14)
(4,18)-(4,42)
(4,18)-(4,32)
(4,33)-(4,34)
(4,35)-(4,39)
(4,40)-(4,42)
*)
