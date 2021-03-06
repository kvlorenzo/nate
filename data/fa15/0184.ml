
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile (let g b = ((f b), (if (f b) = b then false else true)) in (g, b));;

*)

(* changed spans
(3,24)-(3,33)
(3,28)-(3,33)
(3,39)-(3,40)
(5,14)-(5,48)
(5,28)-(5,48)
(5,30)-(5,36)
(5,37)-(5,43)
(5,46)-(5,47)
*)

(* type error slice
(3,2)-(3,59)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,59)
(3,39)-(3,40)
(3,46)-(3,52)
(3,46)-(3,59)
(3,53)-(3,59)
(3,54)-(3,55)
(5,21)-(5,27)
(5,21)-(5,48)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
*)

(* all spans
(2,16)-(3,59)
(3,2)-(3,59)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(3,21)-(3,59)
(3,24)-(3,33)
(3,24)-(3,25)
(3,28)-(3,33)
(3,39)-(3,40)
(3,46)-(3,59)
(3,46)-(3,52)
(3,53)-(3,59)
(3,54)-(3,55)
(3,57)-(3,58)
(5,14)-(5,48)
(5,21)-(5,48)
(5,21)-(5,27)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
(5,37)-(5,43)
(5,38)-(5,39)
(5,41)-(5,42)
(5,46)-(5,47)
*)
