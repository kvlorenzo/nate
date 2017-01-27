
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) != b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(4,31)-(4,32)
(4,31)-(4,45)
(4,36)-(4,39)
(4,36)-(4,45)
(4,49)-(4,50)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,50)
(4,31)-(4,32)
(4,31)-(4,45)
(4,31)-(4,50)
(4,36)-(4,45)
(4,49)-(4,50)
*)