
let sqsum xs = let f a x = a * a in let base = f in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + x in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,28)
(2,27)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)

(* all spans
(2,10)-(2,76)
(2,15)-(2,76)
(2,21)-(2,32)
(2,23)-(2,32)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
(2,52)-(2,66)
(2,67)-(2,68)
(2,69)-(2,73)
(2,74)-(2,76)
*)
