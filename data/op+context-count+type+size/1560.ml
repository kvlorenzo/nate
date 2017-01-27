
let pipe fs =
  let f a x y z = z (fun r  -> y) in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = let an = a in x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,33)
(3,15)-(3,33)
(3,19)-(3,20)
(3,19)-(3,33)
(3,22)-(3,33)
(3,32)-(3,33)
(4,12)-(4,17)
*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,33)
(3,11)-(3,33)
(3,13)-(3,33)
(3,15)-(3,33)
(3,19)-(3,20)
(3,19)-(3,33)
(3,22)-(3,33)
(3,32)-(3,33)
(4,3)-(4,45)
(4,12)-(4,17)
(4,16)-(4,17)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
(4,38)-(4,42)
(4,43)-(4,45)
*)
