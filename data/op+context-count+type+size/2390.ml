
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y = ((f b), (b = (f b))) in wwhile (y, b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let y x = ((f b), (b = (f b))) in wwhile (y, b);;

*)

(* changed spans
(7,32)-(7,47)
*)

(* type error slice
(2,4)-(5,28)
(2,13)-(5,25)
(3,3)-(5,25)
(4,29)-(4,35)
(4,29)-(4,47)
(4,37)-(4,38)
(4,37)-(4,41)
(4,40)-(4,41)
(5,3)-(5,9)
(5,3)-(5,25)
(5,11)-(5,12)
(5,11)-(5,15)
(5,14)-(5,15)
(5,18)-(5,19)
(5,18)-(5,25)
(5,21)-(5,25)
(7,22)-(7,66)
(7,32)-(7,33)
(7,32)-(7,35)
(7,32)-(7,47)
(7,34)-(7,35)
(7,39)-(7,40)
(7,39)-(7,47)
(7,44)-(7,45)
(7,44)-(7,47)
(7,46)-(7,47)
(7,54)-(7,60)
(7,54)-(7,66)
(7,62)-(7,63)
(7,62)-(7,66)
(7,65)-(7,66)
*)