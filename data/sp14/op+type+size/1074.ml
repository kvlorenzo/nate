
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      ((whilesFun f), b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(9,6)-(9,24)
(9,27)-(9,28)
*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,14)
(4,52)-(4,58)
(4,52)-(4,66)
(4,59)-(4,66)
(4,60)-(4,61)
(7,2)-(7,8)
(7,2)-(9,29)
(8,4)-(9,29)
(8,5)-(9,25)
(9,6)-(9,24)
*)

(* all spans
(2,16)-(4,66)
(3,2)-(4,66)
(3,11)-(3,14)
(3,11)-(3,12)
(3,13)-(3,14)
(4,2)-(4,66)
(4,8)-(4,10)
(4,33)-(4,35)
(4,52)-(4,66)
(4,52)-(4,58)
(4,59)-(4,66)
(4,60)-(4,61)
(4,63)-(4,65)
(6,14)-(9,29)
(7,2)-(9,29)
(7,2)-(7,8)
(8,4)-(9,29)
(8,5)-(9,25)
(8,20)-(8,65)
(8,23)-(8,65)
(8,28)-(8,65)
(8,39)-(8,44)
(8,39)-(8,41)
(8,42)-(8,44)
(8,48)-(8,65)
(8,49)-(8,51)
(8,53)-(8,64)
(8,54)-(8,58)
(8,61)-(8,63)
(9,6)-(9,24)
(9,7)-(9,20)
(9,8)-(9,17)
(9,18)-(9,19)
(9,22)-(9,23)
(9,27)-(9,28)
*)
