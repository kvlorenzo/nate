
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (if b = (f b) then (b, false) else ((b, true), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,3)-(6,9)
(6,3)-(6,58)
(6,11)-(6,58)
(6,47)-(6,54)
(6,57)-(6,58)
*)

(* type error slice
(6,11)-(6,58)
(6,14)-(6,15)
(6,14)-(6,22)
(6,30)-(6,31)
(6,30)-(6,38)
(6,33)-(6,38)
(6,47)-(6,48)
(6,47)-(6,54)
(6,47)-(6,58)
(6,50)-(6,54)
(6,57)-(6,58)
*)
