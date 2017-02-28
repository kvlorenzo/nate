
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let helper = if (f b) = b then ((f b), true) else ((f b), false) in
     (helper, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> let b = f x in (b, (b != x))), b);;

*)

(* changed spans
(7,4)-(8,17)
(7,18)-(7,69)
(7,21)-(7,26)
(7,21)-(7,30)
(7,24)-(7,25)
(7,29)-(7,30)
(7,36)-(7,49)
(7,37)-(7,42)
(7,38)-(7,39)
(7,44)-(7,48)
(7,55)-(7,69)
(8,5)-(8,16)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(8,17)
(7,4)-(8,17)
(7,4)-(8,17)
(7,18)-(7,69)
(7,36)-(7,49)
(8,5)-(8,16)
(8,6)-(8,12)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,30)-(3,63)
(3,33)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(8,17)
(6,2)-(8,17)
(6,2)-(6,8)
(7,4)-(8,17)
(7,18)-(7,69)
(7,21)-(7,30)
(7,21)-(7,26)
(7,22)-(7,23)
(7,24)-(7,25)
(7,29)-(7,30)
(7,36)-(7,49)
(7,37)-(7,42)
(7,38)-(7,39)
(7,40)-(7,41)
(7,44)-(7,48)
(7,55)-(7,69)
(7,56)-(7,61)
(7,57)-(7,58)
(7,59)-(7,60)
(7,63)-(7,68)
(8,5)-(8,16)
(8,6)-(8,12)
(8,14)-(8,15)
*)
