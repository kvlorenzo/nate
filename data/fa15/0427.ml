
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (1, b) else (1, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(7,77)
(7,11)-(7,53)
(7,16)-(7,53)
(7,22)-(7,24)
(7,35)-(7,41)
(7,36)-(7,37)
(7,47)-(7,53)
(7,48)-(7,49)
(7,51)-(7,52)
(7,65)-(7,73)
(7,75)-(7,76)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(7,77)
(7,11)-(7,53)
(7,16)-(7,53)
(7,47)-(7,53)
(7,57)-(7,63)
(7,57)-(7,77)
(7,64)-(7,77)
(7,65)-(7,73)
(7,66)-(7,70)
*)

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(7,77)
(7,2)-(7,77)
(7,11)-(7,53)
(7,16)-(7,53)
(7,19)-(7,29)
(7,19)-(7,25)
(7,20)-(7,21)
(7,22)-(7,24)
(7,28)-(7,29)
(7,35)-(7,41)
(7,36)-(7,37)
(7,39)-(7,40)
(7,47)-(7,53)
(7,48)-(7,49)
(7,51)-(7,52)
(7,57)-(7,77)
(7,57)-(7,63)
(7,64)-(7,77)
(7,65)-(7,73)
(7,66)-(7,70)
(7,71)-(7,72)
(7,75)-(7,76)
*)
