
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,21)-(2,72)
*)

(* type error slice
(2,21)-(2,72)
(2,25)-(2,36)
(2,25)-(2,39)
(2,37)-(2,39)
(2,44)-(2,55)
(2,44)-(2,58)
(2,56)-(2,58)
(2,66)-(2,68)
(2,66)-(2,72)
(2,70)-(2,72)
*)