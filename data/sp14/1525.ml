
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,17)
(3,32)-(3,33)
(3,34)-(3,36)
(3,42)-(3,66)
*)

(* type error slice
(3,32)-(3,33)
(3,32)-(3,38)
(3,34)-(3,36)
*)

(* all spans
(2,10)-(3,66)
(3,2)-(3,66)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,17)
(3,21)-(3,66)
(3,32)-(3,38)
(3,34)-(3,36)
(3,32)-(3,33)
(3,37)-(3,38)
(3,42)-(3,66)
(3,42)-(3,56)
(3,57)-(3,58)
(3,59)-(3,63)
(3,64)-(3,66)
*)
