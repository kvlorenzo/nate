
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun f), b);;

*)

(* changed spans
(9,16)-(9,22)
EMPTY
EmptyG

(9,25)-(9,26)
EMPTY
EmptyG

*)
