
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,47)-(3,58)
(3,54)-(3,55)
*)

(* type error slice
(2,4)-(3,60)
(2,17)-(3,58)
(3,3)-(3,58)
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,24)-(3,58)
(3,39)-(3,41)
(3,47)-(3,53)
(3,47)-(3,58)
(3,54)-(3,55)
(3,56)-(3,58)
*)