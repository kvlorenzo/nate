
let pipe fs =
  let f a x = a = (fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,36)
*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,36)
(3,11)-(3,36)
(3,15)-(3,36)
(3,30)-(3,31)
(3,30)-(3,36)
(3,33)-(3,34)
(3,33)-(3,36)
(3,35)-(3,36)
(4,3)-(4,45)
(4,12)-(4,17)
(4,16)-(4,17)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
(4,38)-(4,42)
(4,43)-(4,45)
*)
