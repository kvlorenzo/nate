
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;

*)

(* changed spans
(9,7)-(10,63)
(10,7)-(10,63)
(10,13)-(10,17)
(10,30)-(10,42)
(10,37)-(10,41)
(10,57)-(10,62)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(4,56)-(4,62)
(4,56)-(4,69)
(4,63)-(4,69)
(4,64)-(4,65)
(7,2)-(7,8)
(7,2)-(11,12)
(8,4)-(11,12)
(9,7)-(10,63)
(10,7)-(10,63)
(10,30)-(10,42)
(11,5)-(11,11)
(11,6)-(11,7)
*)

(* all spans
(2,16)-(4,69)
(3,2)-(4,69)
(3,15)-(3,18)
(3,15)-(3,16)
(3,17)-(3,18)
(4,2)-(4,69)
(4,8)-(4,14)
(4,31)-(4,69)
(4,34)-(4,43)
(4,34)-(4,35)
(4,38)-(4,43)
(4,49)-(4,50)
(4,56)-(4,69)
(4,56)-(4,62)
(4,63)-(4,69)
(4,64)-(4,65)
(4,67)-(4,68)
(6,14)-(11,12)
(7,2)-(11,12)
(7,2)-(7,8)
(8,4)-(11,12)
(9,7)-(10,63)
(9,18)-(9,21)
(9,18)-(9,19)
(9,20)-(9,21)
(10,7)-(10,63)
(10,13)-(10,17)
(10,30)-(10,42)
(10,31)-(10,35)
(10,37)-(10,41)
(10,50)-(10,63)
(10,51)-(10,55)
(10,57)-(10,62)
(11,5)-(11,11)
(11,6)-(11,7)
(11,9)-(11,10)
*)
