
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec fs x = ((fs x), ((f b) = b)) in wwhile (fs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fs x = ((f b), ((f b) = b)) in wwhile (fs, b);;

*)

(* changed spans
(6,21)-(6,75)
(6,38)-(6,40)
(6,41)-(6,42)
(6,45)-(6,56)
*)

(* type error slice
(6,21)-(6,75)
(6,32)-(6,57)
(6,36)-(6,57)
(6,37)-(6,43)
(6,38)-(6,40)
*)

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(6,75)
(6,21)-(6,75)
(6,32)-(6,57)
(6,36)-(6,57)
(6,37)-(6,43)
(6,38)-(6,40)
(6,41)-(6,42)
(6,45)-(6,56)
(6,46)-(6,51)
(6,47)-(6,48)
(6,49)-(6,50)
(6,54)-(6,55)
(6,61)-(6,75)
(6,61)-(6,67)
(6,68)-(6,75)
(6,69)-(6,71)
(6,73)-(6,74)
*)
