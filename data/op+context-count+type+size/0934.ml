
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,56)-(2,67)
(2,63)-(2,64)
*)

(* type error slice
(2,4)-(2,77)
(2,17)-(2,75)
(2,24)-(2,75)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,45)-(2,75)
(2,56)-(2,62)
(2,56)-(2,67)
(2,63)-(2,64)
(2,65)-(2,67)
*)
