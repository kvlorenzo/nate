
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(3,50)-(3,60)
(3,57)-(3,58)
*)

(* type error slice
(2,4)-(3,62)
(2,17)-(3,60)
(3,3)-(3,60)
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,29)-(3,60)
(3,43)-(3,44)
(3,50)-(3,56)
(3,50)-(3,60)
(3,57)-(3,58)
(3,59)-(3,60)
*)