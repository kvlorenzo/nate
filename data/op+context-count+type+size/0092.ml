
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,51)
(3,21)-(3,22)
(3,48)-(3,49)
(3,48)-(3,51)
(3,50)-(3,51)
(4,14)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,51)
(3,11)-(3,51)
(3,15)-(3,51)
(3,21)-(3,22)
(3,36)-(3,37)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
(4,42)-(4,44)
*)
