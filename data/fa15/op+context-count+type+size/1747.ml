
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b), (b == (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,50)
(5,52)-(5,53)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(5,21)-(5,27)
(5,21)-(5,54)
(5,28)-(5,54)
(5,29)-(5,50)
*)

(* all spans
(2,16)-(3,58)
(3,2)-(3,58)
(3,15)-(3,18)
(3,15)-(3,16)
(3,17)-(3,18)
(3,22)-(3,58)
(3,25)-(3,30)
(3,25)-(3,28)
(3,29)-(3,30)
(3,36)-(3,38)
(3,44)-(3,58)
(3,44)-(3,50)
(3,51)-(3,58)
(3,52)-(3,53)
(3,55)-(3,57)
(5,14)-(5,54)
(5,21)-(5,54)
(5,21)-(5,27)
(5,28)-(5,54)
(5,29)-(5,50)
(5,30)-(5,35)
(5,31)-(5,32)
(5,33)-(5,34)
(5,37)-(5,49)
(5,38)-(5,39)
(5,43)-(5,48)
(5,44)-(5,45)
(5,46)-(5,47)
(5,52)-(5,53)
*)