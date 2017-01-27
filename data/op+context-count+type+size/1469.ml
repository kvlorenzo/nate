
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> x (a g) in
  let base = function | b -> b in List.fold_left f base fs;;

*)

(* changed spans
(3,34)-(3,35)
(3,36)-(3,37)
(4,3)-(4,59)
*)

(* type error slice
(3,3)-(4,59)
(3,9)-(3,37)
(3,11)-(3,37)
(3,15)-(3,37)
(3,31)-(3,32)
(3,31)-(3,37)
(3,34)-(3,35)
(3,34)-(3,37)
(3,36)-(3,37)
(4,3)-(4,59)
(4,14)-(4,31)
(4,30)-(4,31)
(4,35)-(4,49)
(4,35)-(4,59)
(4,50)-(4,51)
(4,52)-(4,56)
(4,57)-(4,59)
*)
