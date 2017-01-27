
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,51)
(3,21)-(3,22)
(3,48)-(3,49)
(3,48)-(3,51)
(3,50)-(3,51)
(4,14)-(4,22)
(4,14)-(4,42)
(4,23)-(4,42)
(4,46)-(4,70)
*)

(* type error slice
(3,3)-(4,70)
(3,9)-(3,51)
(3,11)-(3,51)
(3,15)-(3,51)
(3,21)-(3,22)
(3,36)-(3,37)
(4,3)-(4,70)
(4,46)-(4,60)
(4,46)-(4,70)
(4,61)-(4,62)
(4,63)-(4,67)
(4,68)-(4,70)
*)