
let g x f = ((f x), ((f x) = x));;

let h q x y = q x y;;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h g f b), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,9)-(2,31)
(2,15)-(2,16)
(2,15)-(2,18)
(2,17)-(2,18)
(2,23)-(2,24)
(2,23)-(2,26)
(2,23)-(2,31)
(4,7)-(4,20)
(4,9)-(4,20)
(4,11)-(4,20)
(4,15)-(4,16)
(4,15)-(4,20)
(4,19)-(4,20)
(9,15)-(9,42)
*)

(* type error slice
(2,4)-(2,35)
(2,7)-(2,31)
(2,9)-(2,31)
(2,15)-(2,16)
(2,15)-(2,18)
(2,15)-(2,31)
(2,17)-(2,18)
(2,23)-(2,24)
(2,23)-(2,26)
(2,23)-(2,31)
(2,25)-(2,26)
(4,4)-(4,22)
(4,7)-(4,20)
(4,9)-(4,20)
(4,11)-(4,20)
(4,15)-(4,16)
(4,15)-(4,20)
(4,17)-(4,18)
(4,19)-(4,20)
(7,9)-(7,10)
(7,9)-(7,12)
(7,11)-(7,12)
(7,50)-(7,56)
(7,50)-(7,62)
(7,58)-(7,59)
(7,58)-(7,62)
(7,61)-(7,62)
(9,22)-(9,28)
(9,22)-(9,42)
(9,31)-(9,32)
(9,31)-(9,38)
(9,31)-(9,42)
(9,33)-(9,34)
(9,35)-(9,36)
(9,37)-(9,38)
(9,41)-(9,42)
*)