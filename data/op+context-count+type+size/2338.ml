
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let f f b =
        if ((f b) = (b, true)) && ((b, true) = ((f b) - 1)) then (b, false) in
      f), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(7,13)-(8,75)
(7,15)-(8,75)
(8,9)-(8,75)
(8,14)-(8,17)
(8,14)-(8,29)
(8,14)-(8,58)
(8,16)-(8,17)
(8,22)-(8,23)
(8,25)-(8,29)
(8,37)-(8,44)
(8,37)-(8,58)
(8,50)-(8,58)
(8,67)-(8,75)
(9,7)-(9,8)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(3,44)-(3,45)
(6,3)-(6,9)
(6,3)-(9,12)
(7,7)-(9,8)
(7,7)-(9,12)
(7,13)-(8,75)
(7,15)-(8,75)
(8,9)-(8,75)
(8,14)-(8,15)
(8,14)-(8,17)
(8,16)-(8,17)
(8,37)-(8,38)
(8,37)-(8,44)
(8,37)-(8,58)
(8,40)-(8,44)
(8,50)-(8,51)
(8,50)-(8,53)
(8,50)-(8,58)
(8,52)-(8,53)
(8,67)-(8,68)
(8,67)-(8,75)
(8,70)-(8,75)
(9,7)-(9,8)
(9,11)-(9,12)
*)
