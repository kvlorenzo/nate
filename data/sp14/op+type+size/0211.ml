
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g (f, b)), b);;


(* fix

let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;

*)

(* changed spans
(2,7)-(2,48)
(2,14)-(2,48)
(2,23)-(2,24)
(2,23)-(2,26)
(2,42)-(2,43)
(6,32)-(6,38)
(6,41)-(6,42)
*)

(* type error slice
(2,3)-(2,50)
(2,7)-(2,48)
(2,14)-(2,48)
(2,30)-(2,48)
(4,37)-(4,38)
(4,37)-(4,40)
(4,55)-(4,61)
(4,55)-(4,69)
(4,62)-(4,69)
(4,63)-(4,64)
(6,21)-(6,27)
(6,21)-(6,43)
(6,28)-(6,43)
(6,29)-(6,39)
(6,30)-(6,31)
*)

(* all spans
(2,7)-(2,48)
(2,14)-(2,48)
(2,23)-(2,26)
(2,23)-(2,24)
(2,25)-(2,26)
(2,30)-(2,48)
(2,31)-(2,33)
(2,35)-(2,47)
(2,36)-(2,38)
(2,41)-(2,46)
(2,42)-(2,43)
(2,44)-(2,45)
(4,16)-(4,77)
(4,23)-(4,77)
(4,37)-(4,40)
(4,37)-(4,38)
(4,39)-(4,40)
(4,44)-(4,77)
(4,47)-(4,49)
(4,55)-(4,69)
(4,55)-(4,61)
(4,62)-(4,69)
(4,63)-(4,64)
(4,66)-(4,68)
(4,75)-(4,77)
(6,14)-(6,43)
(6,21)-(6,43)
(6,21)-(6,27)
(6,28)-(6,43)
(6,29)-(6,39)
(6,30)-(6,31)
(6,32)-(6,38)
(6,33)-(6,34)
(6,36)-(6,37)
(6,41)-(6,42)
*)
