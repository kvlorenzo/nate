
let pipe fs =
  let f a x = a + (x fs) in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,24)
(3,18)-(3,24)
(3,21)-(3,23)
*)

(* type error slice
(3,2)-(3,72)
(3,8)-(3,24)
(3,14)-(3,15)
(3,14)-(3,24)
(3,28)-(3,72)
(3,37)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)

(* all spans
(2,9)-(3,72)
(3,2)-(3,72)
(3,8)-(3,24)
(3,10)-(3,24)
(3,14)-(3,24)
(3,14)-(3,15)
(3,18)-(3,24)
(3,19)-(3,20)
(3,21)-(3,23)
(3,28)-(3,72)
(3,37)-(3,44)
(3,42)-(3,44)
(3,48)-(3,72)
(3,48)-(3,62)
(3,63)-(3,64)
(3,65)-(3,69)
(3,70)-(3,72)
*)
