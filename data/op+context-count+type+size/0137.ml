
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | (x,y) -> if x = b then (f, false) else (f, true) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | f -> if f = b then (f, false) else (f, true) in
     (g, b));;

*)

(* changed spans
(10,8)-(10,75)
(10,40)-(10,41)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(4,57)-(4,63)
(4,57)-(4,69)
(4,65)-(4,66)
(4,65)-(4,69)
(4,68)-(4,69)
(7,3)-(7,9)
(7,3)-(11,11)
(8,6)-(11,11)
(8,12)-(10,75)
(9,8)-(10,75)
(9,21)-(9,22)
(9,21)-(9,24)
(9,23)-(9,24)
(10,8)-(10,75)
(10,37)-(10,75)
(10,52)-(10,53)
(10,52)-(10,60)
(10,55)-(10,60)
(11,7)-(11,8)
(11,7)-(11,11)
(11,10)-(11,11)
*)