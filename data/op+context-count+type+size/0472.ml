
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then ((f b), false) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(5,32)-(5,43)
(5,50)-(5,58)
(5,50)-(5,64)
(5,59)-(5,64)
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
(5,3)-(5,9)
(5,3)-(5,68)
(5,12)-(5,64)
(5,12)-(5,68)
(5,16)-(5,17)
(5,16)-(5,19)
(5,18)-(5,19)
(5,32)-(5,33)
(5,32)-(5,35)
(5,32)-(5,43)
(5,34)-(5,35)
(5,38)-(5,43)
(5,67)-(5,68)
*)
