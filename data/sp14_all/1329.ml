
let pipe fs =
  let f a x = a + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,69)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,14)-(3,15)
EMPTY
EmptyG

(3,14)-(3,23)
EMPTY
EmptyG

(3,36)-(3,41)
EMPTY
EmptyG

(3,40)-(3,41)
y
VarG

*)
